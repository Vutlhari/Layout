// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Layout",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Layout",
            targets: ["Layout"]),
    ],
    targets: [
        .target(
            name: "Layout",
            dependencies: []),
        .testTarget(
            name: "LayoutTests",
            dependencies: ["Layout"]),
    ]
)
