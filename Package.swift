// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-static-content",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "swift-static-content",
            targets: ["swift-static-content"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mhennemeyer/swift-toolbox", from: "2.0.3"),
        .package(url: "https://github.com/mhennemeyer/swift-crayons", from: "1.0.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "swift-static-content",
            dependencies: ["swift-toolbox", "swift-crayons"],
            resources: nil),
        .testTarget(
            name: "swift-static-contentTests",
            dependencies: ["swift-static-content"]),
    ]
)
