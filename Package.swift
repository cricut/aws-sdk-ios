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
            checksum: "d2237a1701341683c2c4ca0f577fe4c31be9ef32b455407307711dac8baca5ab"
        ),
        .binaryTarget(
            name: "AWSCore",
            url: "https://github.com/cricut/aws-sdk-ios/releases/download/2.18.0_kinesis_only/AWSCore.xcframework.zip",
            checksum: "e9730372c97ec46ded095738f780992e1a9218a195700820bf2fbc35dc339161"
        ),
    ]
)
