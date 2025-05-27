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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/2.18.0/IAdvizeSDK.zip",
            checksum: "9531b90a8435d73a694c16f9e519402e553ce57213be028675a00f796cb5d345"
        ),
        .binaryTarget(
            name: "TwilioVideo",
            url: "https://github.com/twilio/twilio-video-ios/releases/download/5.8.3/TwilioVideo.xcframework.zip",
            checksum: "748818a981846612cdef64ac1fe3b8593e75f002116a16421eb5d589540fcfa8"
        )
    ]
)
