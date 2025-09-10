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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/2.18.2/IAdvizeSDK.zip",
            checksum: "142dbfe0fa39a09947fe0a7659c1b89f645700b1138ebf80b0864ab4bbd04f1a"
        ),
        .binaryTarget(
            name: "TwilioVideo",
            url: "https://github.com/twilio/twilio-video-ios/releases/download/5.10.1/TwilioVideo.xcframework.zip",
            checksum: "cada84190cf33254e3cf1e094a704d6987f7f8c3ec1c04b205aaa89c70a74b17"
        )
    ]
)
