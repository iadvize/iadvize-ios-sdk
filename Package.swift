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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/3.0.0-beta1/IAdvizeSDK.zip",
            checksum: "c9d121d5f51da230722bda3563674ba9df17e05d44eb6b6e139c8318089dbcbf"
        )
    ]
)
