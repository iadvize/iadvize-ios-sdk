// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "iAdvize",
    platforms: [
        .iOS("12.0")
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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/2.12.1/IAdvizeSDK.zip",
            checksum: "ecfa5b99a4c2509c38f1cdbd37b67b2c941920aeabffa8441296d308eab9c14b"
        ),
        .binaryTarget(
            name: "TwilioVideo",
            url: "https://github.com/twilio/twilio-video-ios/releases/download/4.6.3/TwilioVideo.xcframework.zip",
            checksum: "1020e84ec9689a04263ff7d32228f92534b1be8a3ec72b7b6fd63717712d2f4a"
        )
    ]
)
