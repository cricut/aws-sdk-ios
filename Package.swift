// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AWSKinesis",
    products: [
        .library(
            name: "AWSKinesis",
            targets: ["AWSKinesis", "AWSCore"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AWSKinesis",
            url: "https://github.com/cricut/aws-sdk-ios/releases/download/2.18.0_kinesis_only/AWSKinesis.xcframework.zip",
            checksum: "18f3b34f07918982aa3ba3e9c05422787e3d364bb9ef5bf5d74c7552de0490c0"
        ),
        .binaryTarget(
            name: "AWSCore",
            url: "https://github.com/cricut/aws-sdk-ios/releases/download/2.18.0_kinesis_only/AWSCore.xcframework.zip",
            checksum: "cb10781bf4c62963ad61065eb4bcbf75fe1e396b2fb551e7d7e43369d8a80c8e"
        ),
    ]
)
