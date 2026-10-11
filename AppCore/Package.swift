// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "AppCore",
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]
        ),
    ],
    targets: [
        .target(
            name: "AppFeature",
        ),
    ]
)
