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