// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Road",
    products: [
        .library(name: "Road", targets: ["Road"]),
    ],
    targets: [
        .target(name: "Road", path: "Sources"),
        .testTarget(name: "RoadTests", dependencies: ["Road"]),
    ]
)
