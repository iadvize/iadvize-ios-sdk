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
            url: "https://github.com/iadvize/iadvize-ios-sdk/releases/download/3.2.0/IAdvizeSDK.zip",
            checksum: "511e3d6d6f4d639e634a5a12d6f77bec6ecfdb2b4a64febd235251e233cd0d55"
        )
    ]
)
