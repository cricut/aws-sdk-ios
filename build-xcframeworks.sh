#!/bin/zsh

set -euxo pipefail

platforms=(iphoneos iphonesimulator)
declare -A archs
archs=( [iphoneos]=arm64 [iphonesimulator]=x86_64 )

BUILD_DIR=build

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

kinesisFlags=()
coreFlags=()

for platform in $platforms; do
    xcodebuild archive \
        SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        -scheme AWSKinesis \
        -sdk $platform \
        -arch $archs[$platform] \
        -archivePath $BUILD_DIR/$platform.xcarchive \
        | { xcpretty || cat }
    kinesisFlags+=(-framework $BUILD_DIR/$platform.xcarchive/Products/Library/Frameworks/AWSKinesis.framework)
    coreFlags+=(-framework $BUILD_DIR/$platform.xcarchive/Products/Library/Frameworks/AWSKinesis.framework)
done

xcodebuild -create-xcframework $kinesisFlags -output $BUILD_DIR/AWSKinesis.xcframework
xcodebuild -create-xcframework $coreFlags -output $BUILD_DIR/AWSCore.xcframework

(cd $BUILD_DIR; zip -r AWSKinesis.xcframework.zip AWSKinesis.xcframework)
(cd $BUILD_DIR; zip -r AWSCore.xcframework.zip AWSCore.xcframework)

KINESIS_CHECKSUM=$(swift package compute-checksum build/AWSKinesis.xcframework.zip)
CORE_CHECKSUM=$(swift package compute-checksum build/AWSCore.xcframework.zip)
sed -E \
    -e 's#"AWSKinesis":.* // AUTO GENERATED#"AWSKinesis": "'$KINESIS_CHECKSUM'" // AUTO GENERATED#' \
    -e 's#"AWSCore":.* // AUTO GENERATED#"AWSKinesis": "'$CORE_CHECKSUM'" // AUTO GENERATED#' \
    -i '' Package.swift
