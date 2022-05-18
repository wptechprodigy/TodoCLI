// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TodoCLI",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .executable(name: "todo", targets: ["TodoCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "TodoCLI",
            dependencies: [
                "TodoCLICore",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .target(name: "TodoCLICore", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser")
        ]),
        .testTarget(
            name: "TodoCLITests",
            dependencies: ["TodoCLI"]),
    ]
)
