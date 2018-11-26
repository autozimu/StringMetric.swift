// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "StringMetric",
    targets: [
        .target(name: "StringMetric", path: "Sources"),
        .testTarget(name: "Tests", dependencies: ["StringMetric"], path: "Tests")
    ]
)
