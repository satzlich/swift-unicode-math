// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "swift-unicode-math",
    products: [
        .library(
            name: "UnicodeMathClass",
            targets: ["UnicodeMathClass"]
        ),
    ],
    targets: [
        .target(
            name: "UnicodeMathClass",
            dependencies: []
        ),
        .testTarget(
            name: "UnicodeMathTests",
            dependencies: ["UnicodeMathClass"]
        ),
    ]
)
