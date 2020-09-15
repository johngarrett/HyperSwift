// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "HyperSwift",
    products: [
        .library(name: "HyperSwift", targets: ["HyperSwift"])
    ],
    targets: [
        .target(name: "HyperSwift")
    ]
)
