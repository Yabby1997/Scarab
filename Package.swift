// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Scarab",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Scarab",
            targets: ["Scarab"]
        ),
    ],
    targets: [
        .target(
            name: "Scarab",
            path: "Scarab"
        )
    ]
)
