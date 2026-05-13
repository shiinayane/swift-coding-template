// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-coding-template",
    targets: [
        .executableTarget(
            name: "CodingTemplate"
        ),
        .testTarget(
            name: "CodingTemplateTests",
            dependencies: ["CodingTemplate"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
