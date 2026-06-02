// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "iAdvize",
    platforms: [
        .iOS(.v15)
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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/3.1.1/IAdvizeSDK.zip",
            checksum: "3b26eca748fe2f67ff476c6835be9d02b16f564ccbf3c7e4cd2e3c95ca79fdbb"
        )
    ]
)
