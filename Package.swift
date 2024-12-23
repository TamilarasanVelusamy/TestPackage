// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestPackageFRM",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TestPackage",
            targets: ["TestPackage"]),
    ],
    dependencies: [
            .package(url: "https://github.com/marmelroy/Zip.git", from: "2.1.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TestPackage",
            dependencies: [
                .target(name: "BRLMPrinterKit"),
                .product(name: "Zip", package: "Zip"),
            ]),
        .testTarget(
            name: "TestPackageTests",
            dependencies: ["TestPackage"]),
        .binaryTarget(
            name: "BRLMPrinterKit",
            path: "./Sources/BRLMPrinterKit.xcframework")
    ]
)
