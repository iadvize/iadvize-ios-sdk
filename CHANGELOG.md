# 2.16.4 (Epoisses)

### Release date 2024/12/09

**Updated**

- Main Thread Execution for Callbacks

To simplify integration and ensure consistency, all delegate methods and completion blocks are now guaranteed to execute on the **main thread**. This means you no longer need to manually switch to the main thread when updating your UI from these callbacks. All relevant delegate methods and completion blocks have been explicitly annotated with `@MainActor`.

- Automatic Push Notifications Handling

Push notifications are now **automatically enabled** every time a visitor is activated using `IAdvizeSDK.activate(projectId:authenticationOption:gdprOption:completion:)`.

​	- Previously, push notifications were only enabled during the first activation. After logout, they were disabled, requiring manual re-enablement on subsequent activations.

​	- Now, push notifications will automatically re-enable during every activation, regardless of whether it’s the visitor’s first or a subsequent activation.

You only need to call `NotificationController.enablePushNotifications(completion:)` if you previously disabled them using `NotificationController.disablePushNotifications(completion:)`.

- Improved accessibility

When the conversation appears, VoiceOver focus is automatically moved to the last message. It is also easier to navigate through messages.

**Bug fixes**

- Fix useless calls performed after logout (access token refresh attempts).
- Fix wrong font used in navigation bar title when using a custom font.
- Fix inconsistent font size in messages when using a custom font.

# 2.16.3 (Epoisses)

### Release date 2024/11/15

**Bug fixes**

- Fix watchdog terminations caused by main thread being blocked by XMPP.
- Fix wrong availability displayed in product card when a new message is received.

# 2.16.2 (Epoisses)

### Release date 2024/11/12

**Bug fixes**

- Fix `Asset validation failed (Invalid CFBundleSupportedPlatforms value)` issue preventing app submission.

# 2.16.1 (Epoisses)

### Release date 2024/11/07

**Features**

- Add Privacy Manifest.

**Bug fixes**

- Fix hangs or crashs that could occur when initializing the SDK.
- Fix rare crash caused by bad date formatting.

**Dependencies**

- Update to iOS 18 / Xcode 16

# 2.16.0 (Epoisses)

### Release date 2024/09/17

**Features**

- Add debug info API to get SDK status
- Add targeting rule trigger failure callback
- Decrease severity of log when registering custom data outside of an ongoing conversation

# 2.15.4 (Dauphin)

### Release date 2024/07/13

**Bug fixes**

- Fix certain cases of authentication deadlock
- Fix keychain error impacting transactions and video

# 2.15.3 (Dauphin)

### Release date 2024/07/03

**Features**

- Add a full debug log level (to use with caution, only with iAdvize approval to live debug)

# 2.15.2 (Dauphin)

### Release date 2024/06/25

**Bug fixes**

- Fix the refreshed auth token not being added to the retry request

# 2.15.0 (Dauphin)

### Release date 2024/06/11

**Features**

- Migrate the XMPP messaging architecture from MUC/SUB to classic MUC

# 2.14.6 (Cantal)

### Release date 2024/06/07

**Bug fixes**

- Fix XMPP handling for GenAI product info messages

# 2.14.5 (Cantal)

### Release date 2024/05/14

**Bug fixes**

- Fix line feed escaping breaking markdown syntax in bot messages

# 2.14.4 (Cantal)

### Release date 2024/03/19

**Bug fixes**

- Fix markdown links not triggering the SDK click handler
- Fix deadlock state in case of first XMPP connection error

# 2.14.3 (Cantal)

### Release date 2024/01/15

**Features**

- Clear iAdvize Push Notifications on chatbox opening
- Add an API for clearing iAdvize Push Notifications on demand

**Bug fixes**

- Fix a UI thread crash when displaying error view

# 2.14.2 (Cantal)

### Release date 2023/12/20

**Features**

- Support simple Markdown syntax inside QuickReply messages
- Add some translations for GDPR messages (cs, da, pl, sk, sv)

**Bug fixes**

- Fix GDPR mode not updating after multiple activations

# 2.14.1 (Cantal)

### Release date 2023/11/27

**Features**

- Support multiline in QuickReply choices

**Bug fixes**

- Add missing completion call on secured auth activation failure callback
- Fix conversation closing regression caused by the token refresh strategy

# 2.14.0 (Cantal)

### Release date 2023/10/24

**Features**

- Add automatic auth token refresh management
- Remove preview image when it is empty (previously used a placeholder)
- Add `ChatboxControllerDelegate.chatboxDidOpen` API

**Bug fixes**

- Fix web & markdown links display
- Fix QuickReplies hit detection when no avatar is set
- Review of Chatbox APIs computation on main UI thread

**Dependencies**

- iOS Target `14.2` -> `15.0`

# 2.13.1 (Beaufort)

### Release date 2023/09/18

**Bug fixes**

- Force Chatbox APIs computation on main UI thread
- Fix WaitingTime messages font

# 2.13.0 (Beaufort)

### Release date 2023/08/08

**Features**

- Allow a more sophisticated message color customization
- Add a LogLevel mode to remove all logs

**Bug fixes**

- Fix conversation management after various network connection issues (phone sleep / app in bakground)

**Dependencies**

- Updated min supported iOS platform from `12.0` to `13.0`

# 2.12.1 (Angelot)

### Release date 2023/05/31

**Bug fixes**

- Fix video conversation flow wrongly changing the conversation channel
- Fix font update on several message types

# 2.12.0

### Release date 2023/05/25

**Features**

- Disable file attachment buttons when it is disabled in Admin chatbox template

**Bug fixes**

- Fix camera still opening after manual permission removal
- Fix targeting listener not being triggered when there is an ongoing conversation
- Fix ongoing conversation being returned as true after closing a video conversation 

# 2.11.1

### Release date 2023/05/03

**Bug fixes**

- Fix ApplicationMode forcing to .prod even in .dev mode

# 2.11.0

### Release date 2023/03/29

**Features**

- Disable satisfaction survey after failed bot transfer if parametrized in the admin
- Handle the Estimated Waiting Time messages

# 2.10.0

### Release date 2023/02/15

**Features**

- Add Swift Package Manager support. See UPGRADING.md for more information on how to integrate via SPM.
- Embed XMPPFramwork inside XCFramework artifact (Twilio is now the only external SDK dependency)

# 2.9.1

### Release date 2023/02/13

**Bug fixes**

- Fix bug in framework generation causing upload issues for integrating app

# 2.9.0

### Release date 2023/02/08

**Features**

- Update our bundle to embed almost all our subdependencies, only Twilio & XMPPFramework remain as external dependencies. See UPGRADING.md for more informations.
> This change will allow you to use any version of Apollo you need, whichever version is used in the SDK will not conflict with your app dependency.

**Bug fixes**

- Fix bot conversation starting without user GDPR consent

**Dependencies**

- Apollo `0.36.0` -> `0.52.0`

# 2.8.4

### Release date 2022/12/30

**Bug fixes**

- Fix NPS values to 0-10 (was 1-10)

# 2.8.3

### Release date 2022/12/09

**Features**

- Add support for visitor blocking

# 2.8.2

### Release date 2022/11/18

**Bug fixes**

- fix build issue with Framework Bundle

# 2.8.1

### Release date 2022/10/25

**Features**

- expose ongoingConversation attribute

**Bug fixes**

- default floating button wasn't dismiss after logout
- presentChatbox() has no effect until an active targeting rule is available

# 2.8.0

### Release date 2022/10/04

**Features**

- Users have now access to video invitations which allows them to jump from a chat conversation to a video one

# 2.7.0

### Release date 2022/08/26

**Features**

- Basic Markdown support in messages

**Bug fixes**

- Image were uploaded and sent twice


# 2.6.0

### Release date 2022/07/05

- Add support for secured authentication mode
- Add support for georouting cards

# 2.5.1

### Release date 2022/07/04

- new release built with Xcode 13.4

# 2.5.0

### Release date 2022/03/30

- Add the in-app Video call feature
- Rework public API to be more consistent

# 2.4.2

### Release date 2022/03/30

- Add 'Apollo/SQLite' dependency

# 2.4.1

### Release date 2022/03/01

- Remove Alamofire and AlamofireImage dependencies
- Build SDK with Xcode 13.2.1

# 2.4.0

### Release date 2022/02/24

- Add satisfaction flow
- Fix some UI glitches in conversation view
- Fix ProductOffer messages not showing

# 2.3.1

### Release date 2021/12/20

- Allow to keep the current targeting rule while registering a user navigation
- Bug fixes & performance improvements

# 2.3.0

### Release date 2021/11/26

- Add a visual indicator on default chat button when there are unread visitor messages
- Add an API to save visitor conversation custom data
- Add typing indicator on visitor and agent side
- Bug fixes & performance improvements

# 2.2.8

### Release date 2021/10/28

- Fix an issue where user messages where sometimes stucked in "Sending"

# 2.2.7

### Release date 2021/10/14

- Update minimum deployment target to 12.0

# 2.2.6

### Release date 2021/10/13

- Update minimum deployment target to 12.4

# 2.2.5

### Release date 2021/10/07

- Xcode 13 support

# 2.2.4

### Release date 2021/10/06

- Fix conversation join after logout and then login of the same user

# 2.2.3

### Release date 2021/10/05

- Conversation creation issue on multiple users switch

# 2.2.2

### Release date 2021/10/01

- Logout issue when no push notification are setup
- NavigationBar tintColor and "load previous messages" button color now following the color setup on the theme

# 2.2.1

### Release date 2021/09/29

- Small UI fixes (iOS 15)

# 2.2.0

### Release date 2021/09/10

- Add anonymous authentication
- Add continuous targeting workflow when a targeting rule is activated
- Add the ability to load past conversations
- Bug fixes & performance improvements

# 2.1.0-beta1

### Release date 2021/07/20

- Add pro-actives bots
- Hide sensitives information from chatbox
- Bug fixes & performance improvements

# 2.0.0-beta1

### Release date 2021/06/18

- Add new conversation workflow to manage real time conversation & targeting
- Revamp SDK Architecture

# 1.15.0

### Release date 2021/04/28

- Add compatibility with Swift 5.4 / Xcode 12.5.

# 1.14.0

### Release date 2021/01/26

- Modify the behaviour of the application deactivation which is now only defined by the administration flag: activated or deactivated. We don't take into account if the visitor has already chatted.

# 1.13.1

### Release date 2020/12/09

- Fix the way we check the attachement upload response which causes an issue on the latest version of Swift.

# 1.13.0

### Release date 2020/11/19

- Add compatibility with Swift 5.3.1 / Xcode 12.2.

# 1.12.0

### Release date 2020/10/21

- Add compatibility with Swift 5.3 / Xcode 12.
- Add Dark Mode support.
- Update dependencies.

# 1.11.0

### Release date 2020/09/23

- Add optional `presentingViewController` parameter when presenting Conversation View, to specify the controller that should perform the presentation.
- Add `didOpenConversation` callback on `IAdvizeConversationManagerDelegate`.

# 1.10.0

### Release date 2020/08/10

- Update dependency from Alamofire 4 to Alamofire 5
- Update iOS deployment target from iOS 9.3 to iOS 10.0 (as required by Alamofire 5)

# 1.9.0

### Release date 2020/07/08

- Add Objective-C compatibility

# 1.8.0

### Release date 2020/06/15

- Add Portuguese localization

# 1.7.1

### Release date 2020/04/29

- Fix missing Simulator architectures

# 1.7.0

### Release date 2020/04/28

- Add Lithuanian localization

# 1.6.5

### Release date 2020/03/20

- Fix an issue when retrying a GraphQL query after a token expiration

# 1.6.4

### Release date 2020/03/06

- Fix an issue on message input view being unproperly dismissed
- Add the possibility to configure the way the Conversation View is presented

# 1.6.3

### Release date 2019/12/20

- Upgrade SwiftGraylog library

# 1.6.2

### Release date 2019/11/08

- Build SDK with Xcode 11 "Build libraries for distribution" flag set to Yes (which includes the .swiftinterface files)

# 1.6.1

### Release date 2019/10/02

- Fix a "modal swipe" issue on iOS 13

# 1.6.0

### Release date 2019/10/01

- Upgrade SDK and dependencies for Xcode 11.0 & Swift 5

# 1.5.0

### Release date 2019/07/10

- Added a GDPR delegate to handle in a custom way the "More Information" action of the user.
- Upgrade SDK and dependencies for Xcode 10.2


# 1.4.0

### Release date 2019/05/14

- Added the possibility to send and receive attachments (files or images) in conversation.
- Update the documentation to precise that the SDK must be activated before registering a User (`IAdvizeManager.shared.registerUser(User(name: "Antoine"))`).

# 1.3.2

### Release date 2019/03/19

- Using the automatic message when accepting the GDPR.


# 1.3.1

### Release date 2019/02/21

- Bug Fix: Update in the input bar in the conversation


# 1.3.0

### Release date 2019/02/21

- Add a property in the ConversationViewConfiguration to update the avatar displayed for the incoming messages.
- Add a property in the IAdvizeManger to update the language of the Conversation targeting.


# 1.2.2

### Release date 2019/01/17

- Bug Fix: management of dates in the conversation.
- UI Fix: avatar position in the conversation.

# 1.2.1

### Release date 2018/12/19

- Bug Fix: automatically hide the default chat button in case of SDK deactivation on the Administration website.


# 1.2.0

### Release date 2018/12/18

- Disabling/Enabling the SDK via iAdvize Administration.
- Added targeting rule to set up message delivery to operators.
- Use of server time for messages.


# 1.1.0

### Release date 2018/10/16

Add the support of Swift 4.2.


# 1.0.2

### Release date 2018/10/09

Upgrade third-party library (Apollo GraphQL) to the latest version (0.9.3).


# 1.0.1

### Release date 2018/09/28

Change pod URL to https.


# 1.0.0

### Release date 2018/09/24

iAdvize Conversation SDK first version.

