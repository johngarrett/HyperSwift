// swift-tools-version:5.2
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
