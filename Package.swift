// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "iAdvize",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "IAdvizeConversationSDK",
            targets: ["IAdvizeConversationSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "IAdvizeConversationSDK",
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/3.0.0-beta2/IAdvizeSDK.zip",
            checksum: "749e9dc425b4f6d3535810b81bdeb70598ff6ee6fae0eee82f12073d84fc3909"
        )
    ]
)
