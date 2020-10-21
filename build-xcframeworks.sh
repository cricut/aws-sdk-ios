#!/bin/zsh

set -euxo pipefail

platforms=(iOS "iOS Simulator" macOS)
BUILD_DIR=build

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

kinesisFlags=()
coreFlags=()

for platform in $platforms; do
    xcodebuild archive \
        SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        -scheme AWSKinesis \
        -destination generic/platform=$platform \
        -archivePath $BUILD_DIR/$platform.xcarchive \
        | { xcpretty || cat }
    kinesisFlags+=(-framework $BUILD_DIR/$platform.xcarchive/Products/Library/Frameworks/AWSKinesis.framework)
    coreFlags+=(-framework $BUILD_DIR/$platform.xcarchive/Products/Library/Frameworks/AWSKinesis.framework)
done

xcodebuild -create-xcframework $kinesisFlags -output $BUILD_DIR/AWSKinesis.xcframework
xcodebuild -create-xcframework $coreFlags -output $BUILD_DIR/AWSCore.xcframework

(cd $BUILD_DIR; zip -r AWSKinesis.xcframework.zip AWSKinesis.xcframework)
(cd $BUILD_DIR; zip -r AWSCore.xcframework.zip AWSCore.xcframework)
