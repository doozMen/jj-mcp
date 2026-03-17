// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "jj-mcp",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/modelcontextprotocol/swift-sdk.git", from: "0.11.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.7.0"),
    ],
    targets: [
        .executableTarget(
            name: "jj-mcp",
            dependencies: [
                "JJMCPKit",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "JJMCPKit",
            dependencies: [
                .product(name: "MCP", package: "swift-sdk"),
            ]
        ),
        .testTarget(
            name: "JJMCPKitTests",
            dependencies: ["JJMCPKit"]
        ),
    ]
)
