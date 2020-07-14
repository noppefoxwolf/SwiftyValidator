// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyValidator",
    products: [
        .library(
            name: "SwiftyValidator",
            targets: ["SwiftyValidator"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftyValidator",
            dependencies: []),
        .testTarget(
            name: "SwiftyValidatorTests",
            dependencies: ["SwiftyValidator"]),
    ]
)
