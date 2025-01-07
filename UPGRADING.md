## 2.16.4 > 2.16.5

*Nothing to report*

## 2.16.3 > 2.16.4

- Main Thread Execution for Callbacks

To simplify integration and ensure consistency, all delegate methods and completion blocks are now guaranteed to execute on the **main thread**. This means you no longer need to manually switch to the main thread when updating your UI from these callbacks. All relevant delegate methods and completion blocks have been explicitly annotated with `@MainActor`.

- Automatic Push Notifications Handling

Push notifications are now **automatically enabled** every time a visitor is activated using `IAdvizeSDK.activate(projectId:authenticationOption:gdprOption:completion:)`.

​	- Previously, push notifications were only enabled during the first activation. After logout, they were disabled, requiring manual re-enablement on subsequent activations.

​	- Now, push notifications will automatically re-enable during every activation, regardless of whether it’s the visitor’s first or a subsequent activation.

You only need to call `NotificationController.enablePushNotifications(completion:)` if you previously disabled them using `NotificationController.disablePushNotifications(completion:)`.

## 2.16.2 > 2.16.3

*Nothing to report*

## 2.16.1 > 2.16.2

*Nothing to report*

## 2.16.0 > 2.16.1

SDK is now built using Xcode 16 / iOS 18.
Please check your project configuration and functionalities after upgrading.

## 2.15.4 > 2.16.0

### Debug Info

This releases adds a new `debugInfo` API that returns the status of the SDK at any given moment. This API could be used for debugging
purposes, you can add the JSON string output to your log reporting tool.

```
IAdvizeSDK.shared.debugInfo()
```

```
{
  "targeting": {
    "screenId": "67BA3181-EBE2-4F05-B4F3-ECB07A62FA92",
    "activeTargetingRule": {
      "id": "D8821AD6-E0A2-4CB9-BF45-B2D8A3CF4F8D",
      "conversationChannel": "chat"
    },
    "isActiveTargetingRuleAvailable": false,
    "currentLanguage": "en"
  },
  "device": {
    "model": "iPhone",
    "osVersion": "17.5",
    "os": "iOS"
  },
  "ongoingConversation": {
    "conversationChannel": "chat",
    "conversationId": "02012815-4BDA-42EF-87DC-5C6ED317AF7F"
  },
  "chatbox": {
    "useDefaultFloatingButton": true,
    "isChatboxPresented": false
  },
  "activation": {
    "activationStatus": "activated",
    "authenticationMode": "simple",
    "projectId": "7260"
  },
  "connectivity": {
    "wifi": true,
    "isReachable": true,
    "cellular": false
  },
  "visitor": {
    "vuid": "d4a57969c7fc4e2a9380f3931fdcee3a965650eb9c6b4",
    "tokenExpiration": "2025-02-27T08:14:11Z"
  },
  "sdkVersion": "2.15.4"
}
```

### Targeting Listener failure callback

This release also adds a callback to notify the integrator about targeting rule trigger failures. This takes the form of a new callback inside
the `TargetingControllerDelegate`: 

```
@objc public protocol TargetingControllerDelegate: AnyObject {
    func activeTargetingRuleAvailabilityDidUpdate(isActiveTargetingRuleAvailable: Bool)

    func activeTargetingRuleDidFailToUpdate(error: TargetingError)
}
```

This will be called when triggering the targeting rule fails and give the reason of the failure when possible.
Please note that the targeting rule triggering may fail, but for standard reasons (for instance if there is no agent availabale to answer). In those cases this `activeTargetingRuleDidFailToUpdate` callback would not be called, only the usual `activeTargetingRuleAvailabilityDidUpdate` would be called with a `false` value for `isActiveTargetingRuleAvailable`.

> To integrate this update you will have to update your code where you use a `TargetingControllerDelegate` to add this new callback.

## 2.15.3 > 2.15.4

*Nothing to report*

## 2.15.2 > 2.15.3

This release adds a new logger level `.all` to force the logging of all possible logs of the SDK. This must be used with caution as latencies may be noticed in the hosting app, so do not use this feature without iAdvize explicit authorization for live debugging.

## 2.15.0 > 2.15.2

*Nothing to report*

## 2.14.6 > 2.15.0

*Nothing to report*

## 2.14.5 > 2.14.6

*Nothing to report*

## 2.14.4 > 2.14.5

*Nothing to report*

## 2.14.3 > 2.14.4

*Nothing to report*

## 2.14.2 > 2.14.3

iAdvize Push Notifications are now automatically cleared from the Notification Center when opening the Chatbox.

## 2.14.1 > 2.14.2

*Nothing to report*

## 2.14.0 > 2.14.1

*Nothing to report*

## 2.13.1 > 2.14.0

*Nothing to report*

## 2.13.0 > 2.13.1

*Nothing to report*

## 2.12.1 > 2.13.0

This release deprecates the ChatboxConfiguration.mainColor setting and adds new ways to customize the look and feel of the messages, both the ones from the visitor and the ones from the agent. Please review the new parameters to customize chatbox messages to your liking.

This release also adds a new LogLevel.NONE to disable all console logs and all logging capture. Please note that this disables iAdvize functional logs aggregation as well so debugging issues will be made harder if this mode is chosen.

## 2.12.0 > 2.12.1

*Nothing to report*

## 2.11.1 > 2.12.0

From this release and onward, the possibility to upload files in the conversation is based on the option
available in the Admin Chatbox Builder. To enable/disable it go to your iAdvize Administration Panel then :
> Engagement > Notifications & Chatbox > Chatbox (Customize) > Composition box (tab) > Allow the visitor to upload images and pdf

## 2.11.0 > 2.11.1

*Nothing to report*

## 2.10.0 > 2.11.0

*Nothing to report*

## 2.9.1 > 2.10.0

Release 2.10.0 bring Swift Package Manager support. You can now add the iAdvize Messenger SDK as a Swift package from Xcode: 

- `File > Add Packages`
- Enter `https://github.com/iadvize/iadvize-ios-sdk` in the search bar
- Select version `2.10.0`
- `Add Package`

## 2.9.0 > 2.9.1

*Nothing to report*

## 2.8.4 > 2.9.0

As of version 2.9.0 the SDK embed its dependencies (all but TwilioVideo & XMPPFramework) inside the XCFramework artifact. Thus if you were using inside your app a version of previously not embedded library (e.g. Apollo) you can now modify the version you use without impact/conflict with the version used in the SDK.

Here is the list of dependencies that were needed externally before 2.9 and are now removed/embedded:

- Apollo
- Apollo/SQLite
- Gifu
- JWTDecode
- SwiftGraylog
- SwiftLint
- SwiftyMarkdown

## 2.8.3 > 2.8.4

*Nothing to report*

## 2.8.2 > 2.8.3

*Nothing to report*

### Integration documentation

Please refer to our up-to-date public integration documentation if needed, it contains code snippets
for each feature of the SDK:
https://developers.iadvize.com/documentation/mobile-sdk