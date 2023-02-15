// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "iAdvize",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "IAdvizeConversationSDK",
                targets: [
                    "IAdvizeConversationSDK",
                    "TwilioVideo"
                ])
    ],
    targets: [
        .binaryTarget(name: "IAdvizeConversationSDK",
                    url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/2.9.1/IAdvizeSDK.zip",
                    checksum: "4d97e6b5e92809022f1c0618b3eee615eb349bc68c0322240e5e4d54842f375b"),
        .binaryTarget(name: "TwilioVideo",
                    url: "https://github.com/twilio/twilio-video-ios/releases/download/4.6.3/TwilioVideo.xcframework.zip",
                    checksum: "1020e84ec9689a04263ff7d32228f92534b1be8a3ec72b7b6fd63717712d2f4a")
    ]
)
