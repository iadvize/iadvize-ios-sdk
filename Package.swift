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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/3.1.0/IAdvizeSDK.zip",
            checksum: "bfc0c44ebca8c04152bd56f854e3e9bbfe213c299df9dad0902f11ddbb2145ec"
        )
    ]
)
