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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/2.16.5/IAdvizeSDK.zip",
            checksum: "f59c8926acbbf1403d67e3474261bfb3c9ce4ae782fdfb07f094912da412256d"
        ),
        .binaryTarget(
            name: "TwilioVideo",
            url: "https://github.com/twilio/twilio-video-ios/releases/download/5.8.3/TwilioVideo.xcframework.zip",
            checksum: "748818a981846612cdef64ac1fe3b8593e75f002116a16421eb5d589540fcfa8"
        )
    ]
)
