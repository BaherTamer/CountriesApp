// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreLayer",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CoreLayer",
            targets: ["CoreLayer"]
        ),
    ],
    targets: [
        .target(
            name: "CoreLayer"
        ),
    ]
)
