// swift-tools-version:5.3
import PackageDescription

enum Checksums: String {
  case kinesis = "c08398867c6ef3af3e268b58209ac23a3daf8aa7b809a2a258097b99a4a51108" // AUTO GENERATED
  case core = "cc4892e0a1a50a1a4e3da62536c1a1bb8205f80f9004b18f49e1d754ea2356bf" // AUTO GENERATED
}

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
            checksum: Checksums.kinesis.rawValue
        ),
        .binaryTarget(
            name: "AWSCore",
            url: "https://github.com/cricut/aws-sdk-ios/releases/download/2.18.0_kinesis_only/AWSCore.xcframework.zip",
            checksum: Checksums.core.rawValue
        ),
    ]
)
