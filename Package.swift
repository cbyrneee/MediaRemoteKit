// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MediaRemoteKit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "MediaRemoteKit",
            targets: ["MediaRemoteKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MediaRemoteKit",
            dependencies: []
        ),
        .testTarget(
            name: "MediaRemoteKitTests",
            dependencies: ["MediaRemoteKit"]
        ),
    ]
)
