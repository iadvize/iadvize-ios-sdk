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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/3.0.0/IAdvizeSDK.zip",
            checksum: "74e55c4bee1b37900a772bce175bad326caf00e5e1c8128dc694b8095a7804eb"
        )
    ]
)
