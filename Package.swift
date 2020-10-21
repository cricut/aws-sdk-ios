// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AWSKinesis",
    products: [
        .library(
            name: "AWSKinesis",
            targets: ["AWSKinesis.xcframework", "AWSCore.xcframework"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AWSKinesis.xcframework",
            url: "https://github.com/cricut/aws-sdk-ios/releases/download/cobbal/kinesis-only-2.18.0/AWSKinesis.xcframework.zip",
            checksum: "18f3b34f07918982aa3ba3e9c05422787e3d364bb9ef5bf5d74c7552de0490c0"
        ),
        .binaryTarget(
            name: "AWSCore.xcframework",
            url: "https://github.com/cricut/aws-sdk-ios/releases/download/cobbal/kinesis-only-2.18.0/AWSCore.xcframework.zip",
            checksum: "cb10781bf4c62963ad61065eb4bcbf75fe1e396b2fb551e7d7e43369d8a80c8e"
        ),
    ]
)
