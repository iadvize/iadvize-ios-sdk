// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Dependencies",
            targets: ["Dependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/iadvize/iadvize-ios-sdk", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "Dependencies",
            dependencies: [
                .product(name: "IAdvizeConversationSDK", package: "iadvize-ios-sdk")
            ]
        )
    ]
)
