// swift-tools-version:5.3
import PackageDescription

let checksums = [
  "AWSKinesis": "684eba9b21490f73fb9e6fd070c0d34a3e4decdf192794aaf6be7340d7af0028" // AUTO GENERATED
  "AWSKinesis": "93c09527df975671b73ef30ed5248bf06f6a5db98e58bcc8f4b938457cd1b3c2" // AUTO GENERATED
]

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
            checksum: checksums["AWSKinesis"]
        ),
        .binaryTarget(
            name: "AWSCore",
            url: "https://github.com/cricut/aws-sdk-ios/releases/download/2.18.0_kinesis_only/AWSCore.xcframework.zip",
            checksum: checksums["AWSCore"]
        ),
    ]
)
