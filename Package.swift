// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "GAuthSwiftParser",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "GAuthSwiftParser",
            targets: ["GAuthSwiftParser"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMinor(from: "1.6.0")),
        .package(url: "https://github.com/lachlanbell/SwiftOTP.git", .upToNextMinor(from: "3.0.0"))
    ],
    targets: [
        .target(
            name: "GAuthSwiftParser",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "SwiftOTP", package: "SwiftOTP")
            ],
            swiftSettings: [
                .define("GAUTHSWIFTPARSER_SPM")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
