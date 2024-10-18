// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExerciseKit",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ExerciseKit",
            targets: ["ExerciseKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.14.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ExerciseKit"),
        .testTarget(
            name: "ExerciseKitTests",
            dependencies: ["ExerciseKit"]),
        .testTarget(name: "ExerciseKitSnapshotTests",
                    dependencies: [
                        "ExerciseKit",
                        .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
                    ],
                   exclude: ["__Snapshots__"]
                   )
    ]
)
