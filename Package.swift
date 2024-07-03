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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/2.15.3/IAdvizeSDK.zip",
            checksum: "92fb432140970f95945ff05ddd5051f64f63426cac2afa3813c377f4710e9c66"
        ),
        .binaryTarget(
            name: "TwilioVideo",
            url: "https://github.com/twilio/twilio-video-ios/releases/download/4.6.3/TwilioVideo.xcframework.zip",
            checksum: "1020e84ec9689a04263ff7d32228f92534b1be8a3ec72b7b6fd63717712d2f4a"
        )
    ]
)
