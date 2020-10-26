// swift-tools-version:5.3
import PackageDescription

enum Checksums: String {
  case kinesis = "e57c8711cd1a67451c630348ee394a053f7911352af1192150a6454408d19bc7" // AUTO GENERATED
  case core = "604acac4dd46fd349516be81a6f0bfd30f75e9d83f4c1e1eb67bf60861fae0da" // AUTO GENERATED
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
