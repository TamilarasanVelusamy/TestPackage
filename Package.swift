// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestPackage",
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
            .package(path: "./Sources/PepNetworkingPackage")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TestPackage",
            dependencies: [
                .target(name: "BRLMPrinterKit"),
                //.target(name: "FWUpdateSDK"),
                .product(name: "Zip", package: "Zip"),
            ]),
        .testTarget(
            name: "TestPackageTests",
            dependencies: ["TestPackage"]),
        .binaryTarget(
            name: "BRLMPrinterKit",
            path: "./Sources/BRLMPrinterKit.xcframework")
       /* .binaryTarget(
            name: "FWUpdateSDK",
            path: "./Sources/FWUpdateSDK.xcframework") */
    ]
)
