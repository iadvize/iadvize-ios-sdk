// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "iAdvize",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "IAdvizeConversationSDK",
            targets: ["IAdvizeConversationSDK", "TwilioVideo"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "IAdvizeConversationSDK",
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/2.18.3/IAdvizeSDK.zip",
            checksum: "3857fe446575d7b50557fc9f95c79125bb0d238cef443037d3defa52843bf2f4"
        ),
        .binaryTarget(
            name: "TwilioVideo",
            url: "https://github.com/twilio/twilio-video-ios/releases/download/5.10.1/TwilioVideo.xcframework.zip",
            checksum: "cada84190cf33254e3cf1e094a704d6987f7f8c3ec1c04b205aaa89c70a74b17"
        )
    ]
)
