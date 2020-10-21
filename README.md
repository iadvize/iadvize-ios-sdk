# iAdvize - iOS Conversation SDK

Take your app to the next step and provide a unique conversational experience to your users!

Embed the iAdvize Conversation SDK in your app and connect your visitors with your professional operators or ibbü experts through a fully customised chat experience. Visitors can ask a question and will receive answers directly on their devices with push notifications, in or outside your app.



You will find an example of integration in the ` Example/IAdvizeSwiftExample` folder of this repository.

Just run `pod install`, open the `IAdvizeSwiftExample.xcworkspace` and run the project. You can copy and paste the `Podfile` into your project to easily test it into your app.



## Compatibility

|     Version      | Minimum iOS Version | Swift Version |
| :--------------: | :-----------------: | :-----------: |
|      1.12.0      |      iOS 10.0       |   Swift 5.3   |
| 1.10.0 to 1.11.0 |      iOS 10.0       |   Swift 5.2   |
|  1.6.0 to 1.9.0  |       iOS 9.3       |    Swift 5    |
|  1.1.0 to 1.5.0  |       iOS 9.3       |   Swift 4.2   |
|  1.0.0 to 1.0.2  |       iOS 9.3       |    Swift 4    |



## [Integration](#integrate)

- [App creation](#creation)
- [SDK dependency](#dependency)
- [Permissions](#permissions)
- [Logging](#logging)
- [Targeting Language](#targeting-language)
- [Registering your application ID](#register)
- [Activating the SDK](#activate)
- [Conversation View](#conversationview)
- [GDPR](#gdpr)
- [Registering push token](#push)
- [Registering user](#user)
- [Chat button](#button)
- [Push notification](#notification)
- [Registering a transaction](#transaction)
- [Be notified about incoming messages](#incomingmessages)



## [Customisation](#customise)

- [Chat button](#customisebutton)
- [Conversation view](#customiseconversation)
- [Presentation](#customisepresentation)
- [Main color](#customisecolor)
- [Navigation bar](#customisenavigation)
- [Font](#customisefont)
- [Automatic message](#customisemessage)
- [GDPR message](#customisegdpr)
- [Brand avatar](#avatar)



<a name="integrate"></a>

# Integration



<a name="creation"></a>

## App creation

Ask your iAdvize Admin to create a “Mobile App” on the administration website and to give you those two information displayed in the “Mobile App” list (`application ID`, `JWT secret`).

To create the Mobile App, you will need to provide to your Administrator some information regarding the push notifications:

Having your push certificate `.p12` file (a Production one, which we can use for both Sandbox and Production environment), you have to extract the Certificate and the Private key in clear text.

To do so, simply run in your Terminal :

 `openssl pkcs12 -in AppProductionPushCertificate.p12 -out Cert.pem -nodes -clcerts`

then  `cat Cert.pem` and you can copy/paste the certificate and the private key (with their separators `-----BEGIN ...-----` and `-----END ...-----`) and provide it as printed in the Terminal.


You can register your application to the `SDKStatusDelegate` in `IAdvizeManager` to be informed when the SDK is enabled or disabled in the iAdvize administration website.

<a name="dependency"></a>

## SDK dependency

### Cocoapods

Using Cocoapods, add this line to your Podfile:

```
pod 'iAdvize'
```

then run `pod install` to fetch the dependency.



<a name="permissions"></a>

## Permissions

You must add `Privacy - Camera Usage Description` and `Privacy - Photo Library Usage Description` to your `plist` in order to be able to send images in a conversation.



<a name="logging"></a>

## Logging

By default, the SDK will only log Warnings and Errors in the Xcode console. You can make it more verbose and choose between multiple levels of log for a better integration experience:

`IAdvizeManager.shared.logLevel = .verbose`



<a name="targeting-language"></a>

## Targeting Language

By default, the SDK will use the device language for **targeting a conversation**. With this variable you can specify the language you want to use for targetting:

`IAdvizeManager.shared.language = SDKLanguageOption.custom(value: .fr)`

> :warning: The `IAdvizeManager.shared.language` property is NOT intended to change the language displayed in the SDK.

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

The `ruleId` allow to target visitors proactively or reactively, based on their browsing behaviour, their profile or their business criteria (e.g. basket amount, scoring, etc). Ask your iAdvize Admin to give you this identifier.

Once the iAdvize Conversation SDK is successfully activated, you should see a message like this in the IDE console:

```
iAdvize Conversation: ✅ iAdvize conversation activated, the version is x.x.x.
```



A completion handler is available in order to know if the SDK has been successfully activated (and to retry later if the activation fails):

```
IAdvizeManager.shared.activate(jwtOption: .token("yourjwttoken"), externalId: "connecteduseruniqueidentifierornil", ruleId: UUID(uuidString: "targetingruleid")) { success, isEnabled in
}
```


N.B. You have to check if the activation succeeds before you try to show a Chat Button (the default or a custom one). You also have to check the `isEnabled` flag which indicates you if the SDK is currently enabled or disabled by the SDK Administrator.



<a name="conversationview"></a>

## Present the iAdvize Conversation View

If you use the provided iAdvize Chat Button we will automatically present the Conversation View when your user taps on it.

If you want to implement your own way to display the iAdvize Conversation View we provide you two methods to present/dismiss the iAdvize Conversation View:


```swift
IAdvizeConversationManager.shared.presentConversationViewModal()

IAdvizeConversationManager.shared.dismissConversationViewModal()

```

You also have a utils method to know if the Conversation View is already displayed:

```swift
IAdvizeConversationManager.shared.isConversationViewPresented()
```


<a name="gdpr"></a>

## GDPR

By default when you activate the SDK, the GDPR will be disabled. You can activate the GDPR feature by passing a new parameter to the activate method and provide a mandatory Legal Information URL link or a delegate to manage your own action on the tap on `More information` button with it:

```swift
IAdvizeManager.shared.activate(jwtOption: .token("yourjwttoken"), externalId: "connecteduseruniqueidentifierornil", gdprOption: .enabled(gdprEnabledOption: .legalInformation(legalUrl: URL("https://www.iadvize.com/en/legal-notice/"))), ruleId: UUID(uuidString: "targetingruleid")
```

```swift
IAdvizeManager.shared.activate(jwtOption: .token("yourjwttoken"), externalId: "connecteduseruniqueidentifierornil", gdprOption: .enabled(option: .delegate(delegate: self)), ruleId: UUID(uuidString: "targetingruleid")
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



<a name="user"></a>

## Registering user

You can register User information which will be displayed in the profile section of the ChatBox on the operator Desk. To do so just call the `registerUser()` method on the `IAdvizeManager` object:

```swift
IAdvizeManager.shared.registerUser(User(name: "Antoine"))
```

Note: You need to activate the SDK (see step 4) before registering the User.



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


If you need, you can enable or disable the push notifications (there are enabled by default)
```swift
IAdvizeManager.shared.enablePushNotifications { success in 
 // ...
}
IAdvizeManager.shared.disablePushNotifications { success in 
 // ...
}
```

<a name="transaction"></a>

## Registering a transaction

When you want to register a transaction within your application, you can call the following method by passing a `Transaction` object:

```swift
let transaction = Transaction(externalTransactionId: "transactionId", date: Date(), amount: 500.0, currency: .eur)

IAdvizeTransactionManager.shared.registerTransaction(transaction)
```

To customise the SDK, check the next section.


<a name="incomingmessages"></a>

## Be notified about incoming messages

You can setup a delegate to be able to be informed when a new operator message has been received and to know how many of them are actually unread.


```swift
extension YourObject: IAdvizeConversationManagerDelegate {
    func didUpdateUnreadMessagesCount(unreadMessagesCount: Int) {

    }

    func didReceiveNewMessage(content: String) {

    }
}

class YourObject {
    func setupDelegate() {
        IAdvizeConversationManager.shared.delegate = self
    }
}
```


<a name="customise"></a>

# Customisation


<a name="customisebutton"></a>

## Chat button

By default, the SDK provides you a Chat button which you can integrate as-is. You can easily implement your own Chat button and by just calling the two methods below, you will be able to present (or dismiss) the Conversation View:

```swift
IAdvizeConversationManager.shared.presentConversationViewModal()
IAdvizeConversationManager.shared.dismissConversationViewModal()
```

You can also update the Chat Button position:

```
    /// Set the chat button (the default one) position. Use this method if you use the iAdvize
    /// default chat button and you use showChatButton()/hideChatButton() methods to display/hide it.
    ///
    /// We use autolayout constraints to place the chat button in the designated view (the main
    /// window by default) and to move it.
    ///
    /// The default chat button is aligned to the bottom-left of the screen with a default
    /// margin to (left: 10, bottom: 10). Increasing the bottom margin value will move the chat
    /// button up and increasing the left margin value will move the chat button left.
    ///
    ///                 Container view (default = main window)
    ///                    +----------------------------------+
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |                                  |
    ///                    |             chatButtonView       |
    ///           leftMargin = 10   +----+                    |
    ///                    <------> |    |                    |
    ///                    |        |    |                    |
    ///                    |        +--^-+                    |
    ///                    |            |                     |
    ///                    |            | bottomMargin = 10   |
    ///                    +------------v---------------------+


IAdvizeConversationManager.shared.setChatButtonPosition(leftMargin: leftMargin, bottomMargin: bottomMargin)
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

<a name="customisepresentation"></a>

## Presentation style

You can customise the presentation style of the Conversation View:


```swift
// Update the Conversation View presentation style.
configuration.presentationStyle = .fullScreen
```


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

A first automatic message can be setup to be displayed as an operator message in the Conversation View. By default, no message will be displayed. This message will also be used and displayed when the user accepts the GDPR. You can set an automatic message through the Conversation configuration:

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



<a name="avatar"></a>

## Brand avatar

You can update the brand avatar displayed for the incoming messages. You can specify an URL or a Drawable. Gifs are not supported. You can set an avatar through the Conversation configuration:


```swift
// Update the incoming message avatar with a UIImage
configuration.incomingMessageAvatar = IncomingMessageAvatar.image(image: UIImage(named: "BrandAvatar"))

// Update the incoming message avatar with an URL
if let avatarUrl = URL(string: "your-url") {
    configuration.incomingMessageAvatar = IncomingMessageAvatar.url(url: avatarUrl)
}
```





Well done! You’re now ready to take your app to the next step and provide a unique conversational experience to your users! 🚀
