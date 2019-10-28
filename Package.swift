// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "StringMetric",
    products: [
        .library(name: "StringMetric", targets: ["StringMetric"]),
    ],
    targets: [
        .target(name: "StringMetric", path: "Sources"),
        .testTarget(name: "StringMetricTests", dependencies: ["StringMetric"], path: "Tests/StringMetricTests")
    ]
)
