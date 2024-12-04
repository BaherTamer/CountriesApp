// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountriesModule",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CountriesModule",
            targets: ["CountriesModule"]
        ),
    ],
    dependencies: [
        .package(path: "../../Core/CoreLayer"),
        .package(path: "../../Core/NetworkLayer")
    ],
    targets: [
        .target(
            name: "CountriesModule",
            dependencies: [
                .product(name: "CoreLayer", package: "CoreLayer"),
                .product(name: "NetworkLayer", package: "NetworkLayer")
            ],
            resources: [
                .process("Localizable.xcstrings"),
                .process("Media.xcassets")
            ]
        ),
        .testTarget(
            name: "CountriesModuleTests",
            dependencies: [
                "CountriesModule",
                .product(name: "CoreLayer", package: "CoreLayer"),
                .product(name: "NetworkLayer", package: "NetworkLayer")
            ]
        ),
    ]
)
