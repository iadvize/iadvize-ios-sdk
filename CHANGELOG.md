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

