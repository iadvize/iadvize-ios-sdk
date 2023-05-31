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