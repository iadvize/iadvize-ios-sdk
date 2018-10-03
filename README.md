# iAdvize - iOS Conversation SDK

Take your app to the next step and provide a unique conversational experience to your users!

Embed the iAdvize Conversation SDK in your app and connect your visitors with your professional agents or ibbü experts through a fully customised chat experience. Visitors can ask a question and will receive answers directly on their devices with push notifications, in or outside your app.



You will find an example of integration in the ` Example/IAdvizeSwiftExample` folder of this repository.

Just run `pod install`, open the `IAdvizeSwiftExample.xcworkspace` and run the project.



## [Integration](#integrate)

- [App creation](#creation)
- [SDK dependency](#dependency)
- [Logging](#logging)
- [Registering your application ID](#register)
- [Activating the SDK](#activate)
- [GDPR](#gdpr)
- [Registering push token](#push)
- [Chat button](#button)
- [Push notification](#notification)
- [Registering a transaction](#transaction)



## [Customisation](#customise)

- [Chat button](#customisebutton)
- [Conversation view](#customiseconversation)
- [Main color](#customisecolor)
- [Navigation bar](#customisenavigation)
- [Font](#customisefont)
- [Automatic message](#customisemessage)
- [GDPR message](#customisegdpr)



<a name="integrate"></a>

# Integration



<a name="creation"></a>

## App creation

Ask your iAdvize Admin to create a “Mobile App” on the administration website and to give you those two information displayed in the “Mobile App” list (`application ID`, `JWT secret`).

To create the Mobile App, you will need to provide to your Administrator some information regarding the push notifications:

Having your push certificate `.p12` file (a Production one, which we can use for both Sandbox and Production environment), you have to extract the Certificate and the Private key in clear text.

To do so, simply run in your Terminal :

 `openssl pkcs12 -in AppProductionPushCertificate.p12 -out Cert.pem -nodes -clcerts`

then  `cat Cert.pem` and you can copy/paste the certificate and the private key and provide it as printed in the Terminal.



<a name="dependency"></a>

## SDK dependency

### Cocoapods

Using Cocoapods, add this line to your Podfile:

```
pod 'iAdvize'
```

then run `pod install` to fetch the dependency.



<a name="logging"></a>

## Logging

By default, the SDK will only log Warnings and Errors in the Xcode console. You can make it more verbose and choose between multiple levels of log for a better integration experience:

`IAdvizeManager.shared.logLevel = .verbose`



<a name="register"></a>

## Registering your application ID

Using the application ID (see [App creation](#creation) above), you can register your application by calling:

```swift
IAdvizeManager.shared.registerApplicationId("your-own-application-identifier-uuid")
```



<a name="activate"></a>

## Activating the SDK

You have two ways to activate the iAdvize Conversation SDK depending on the security model you choose.

- For the in-app security model:

```swift
IAdvizeManager.shared.activate(jwtOption: .secret("yourjwtsecret"), externalId: "connecteduseruniqueidentifierornil")
```

- For the server-side security model:

```swift
IAdvizeManager.shared.activate(jwtOption: .token("yourjwttoken"), externalId: "connecteduseruniqueidentifierornil")
```

The `externalId` is a unique identifier you can provide to identify your connected user across sessions and devices. It should not contain any private information (should not be an email, a phone number, a name...) of the user and should be opaque and unforgeable (e.g. a dynamic UUID). If your user isn’t logged-in you can pass a void value for this parameter (`nil` in Swift).

Once the iAdvize Conversation SDK is successfully activated, you should see a message like this in the IDE console:

```
iAdvize Conversation: ✅ iAdvize conversation activated, the version is x.x.x.
```



A completion handler is available in order to know if the SDK has been successfully activated (and to retry later if the activation fails):

```
IAdvizeManager.shared.activate(jwtOption: .token("yourjwttoken"), externalId: "connecteduseruniqueidentifierornil") { success in
}
```



N.B. You have to check if the activation succeeds before you try to show a Chat Button (the default or a custom one).



<a name="gdpr"></a>

## GDPR

By default when you activate the SDK, the GDPR will be disabled. You can activate the GDPR feature by passing a new parameter to the activate method and provide a mandatory Legal Information URL link with it:

```swift
IAdvizeManager.shared.activate(jwtOption: .token("yourjwttoken"), externalId: "connecteduseruniqueidentifierornil", gdprOption: .enabled(URL("https://www.iadvize.com/en/legal-notice/")))
```

The GDPR process is now activated for your users and a default message will be provided to collect the user consent. Please check the [Customise](#customise) section below if you want to customise this message.



<a name="push"></a>

## Registering push token

In order to allow your users to receive operators or experts answers in real time, you should register the current push token of the device:

```swift
IAdvizeManager.shared.registerPushToken("pushtoken", applicationMode: .prod)
```

You can register it at any time after you activate the SDK (see [Activating the SDK](#activate) above).



**N.B.**: If you are in `Debug` mode you must pass `applicationMode: .dev` to the `registerPushToken` call (to properly receive push notifications). You could easily add some preprocessor macros to manage both cases:



e.g. with a `DEBUG` flag and preprocessor macro defined in your Build Settings for the `Debug` configuration:

```
        #if DEBUG
        IAdvizeManager.shared.registerPushToken(pushToken, applicationMode: .dev)
        #else
        IAdvizeManager.shared.registerPushToken(pushToken, applicationMode: .prod)
        #endif
```



<a name="button"></a>

## Chat button

In order to invite your users to enter in a conversational experience, you have to display the default Chat button (see the [Customise](#customise) section below if you want to display your own). You can also, at any time, hide it. To do this you can simply use:



```swift
IAdvizeConversationManager.shared.showChatButton()
IAdvizeConversationManager.shared.hideChatButton()
```



By default, it will be displayed on the main window of your app (on top of any view). You can also show the Chat Button on your custom view:



```swift
IAdvizeConversationManager.shared.showChatButton(viewOrWindow: myCustomView)
```





<a name="notification"></a>

## Push notification

Once you receive a push notification, you can easily verify that this notification concerns the SDK and ask the SDK to handle this notification for you:

```swift
IAdvizeManager.shared.isIAdvizePushNotification(with: userInfo)
IAdvizeManager.shared.handlePushNotification(with: userInfo)
```

*where userInfo is the dictionary contained in the push notification.



You can easily modify the title of the push notification by adding this key in your Localizable.strings file:

`iadvize_notification_title`



We provides you translations which you can directly add to your Localizable.strings file if you don't want to customise it: https://github.com/iadvize/iadvize-ios-sdk/tree/master/translations/

<a name="transaction"></a>

## Registering a transaction

When you want to register a transaction within your application, you can call the following method by passing a `Transaction` object:

```swift
let transaction = Transaction(externalTransactionId: "transactionId", date: Date(), amount: 500.0, currency: .eur)

IAdvizeTransactionManager.shared.registerTransaction(transaction)
```

To customise the SDK, check the next section.



<a name="customise"></a>

# Customisation



<a name="customisebutton"></a>

## Chat button

By default, the SDK provides you a Chat button which you can integrate as-is. You can easily implement your own Chat button and by just calling the two methods below, you will be able to present (or dismiss) the Conversation View:

```swift
IAdvizeConversationManager.shared.presentConversationViewModal()
IAdvizeConversationManager.shared.dismissConversationViewModal()
```



<a name="customiseconversation"></a>

## Conversation view

For the next steps, you will have access to a configuration “object” to customise all Conversation View attributes. You can access the default configuration and update it like this:

```swift
// Get the current configuration
var configuration = IAdvizeConversationManager.shared.configuration
// Update some configuration attributes
configuration.mainColor = UIColor.red
// Setup this new configuration
IAdvizeConversationManager.shared.setupConversationView(configuration: configuration)
```



For the next steps, we will only show you the different attributes that you can setup on this “configuration” object.



<a name="customisecolor"></a>

## Main color

You can setup a main color on the SDK which will be applied to the color of:

- the default Chat button (if you use it)
- the send button in the Conversation View
- the blinking text cursor in the “new message” input in the Conversation View
- the background color of the message bubbles (only for sent messages)



```swift
// Update the main color
configuration.mainColor = UIColor.red
```



<a name="customisenavigation"></a>

## Navigation bar

You can configure the Navigation bar of the Conversation View and modify:

- the background color
- the main color
- the title



```swift
// Update the background color of the navigation bar
configuration.navigationBarBackgroundColor = UIColor.black
// Update the main color of the navigation bar (color of buttons and labels inside it)
configuration.navigationBarMainColor = UIColor.white
// Update the title of the navigation bar
configuration.navigationBarTitle = "Conversation"
```



<a name="customisefont"></a>

## Font

You can update the font used in the UI of the IAdvize Conversation SDK. You just have to call this method to setup your own font:



```swift
// Update the font
configuration.font = UIFont(name: "AmericanTypewriter-Condensed", size: 11.0)
```



<a name="customisemessage"></a>

## Automatic message

A first automatic message can be setup to be displayed as an operator message in the Conversation View. By default, no message will be displayed. You can set an automatic message through the Conversation configuration:

```swift
// Update the automatic message
configuration.automaticMessage = "Hi, just ask a question and we will answer you asap!"
```



<a name="customisegdpr"></a>

## GDPR message

If you want to activate the GDPR consent collect feature through the iAdvize Conversation SDK, please refer to the [GDPR](#gdpr) section above.

Once the GDPR is activated, you can easily customise the GDPR message you want to display to your users to collect their consent:

```swift
// Update the GDPR message
configuration.gdprMessage = "Your own GDPR message."
```





Well done! You’re now ready to take your app to the next step and provide a unique conversational experience to your users! 🚀
