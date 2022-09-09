#!/bin/bash
set -e

WORKING_DIR=$(pwd)

FRAMEWORK_FOLDER_NAME="JFrogSDK_XCFramework"

FRAMEWORK_NAME="JFrogSDK"

FRAMEWORK_PATH="${WORKING_DIR}/${FRAMEWORK_FOLDER_NAME}/${FRAMEWORK_NAME}.xcframework"

BUILD_SCHEME="JFrogSDK"

SIMULATOR_ARCHIVE_PATH="${WORKING_DIR}/${FRAMEWORK_FOLDER_NAME}/simulator.xcarchive"

IOS_DEVICE_ARCHIVE_PATH="${WORKING_DIR}/${FRAMEWORK_FOLDER_NAME}/iOS.xcarchive"

CATALYST_ARCHIVE_PATH="${WORKING_DIR}/${FRAMEWORK_FOLDER_NAME}/catalyst.xcarchive"

rm -rf "${WORKING_DIR}/${FRAMEWORK_FOLDER_NAME}"

echo "Deleted ${FRAMEWORK_FOLDER_NAME}"

mkdir "${FRAMEWORK_FOLDER_NAME}"

echo "Created ${FRAMEWORK_FOLDER_NAME}"

echo "Archiving ${FRAMEWORK_NAME}"

echo "Archiving for Simulator...."

xcodebuild archive ONLY_ACTIVE_ARCH=NO -scheme ${BUILD_SCHEME} -destination="generic/platform=iOS Simulator" -archivePath "${SIMULATOR_ARCHIVE_PATH}" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

echo "Archiving for Device......"

xcodebuild archive -scheme ${BUILD_SCHEME} -destination="generic/platform=iOS" -archivePath "${IOS_DEVICE_ARCHIVE_PATH}" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

echo "Archiving for Mac"

xcodebuild archive -scheme ${BUILD_SCHEME} -destination='generic/platform=macOS,variant=Mac Catalyst' -archivePath "${CATALYST_ARCHIVE_PATH}" SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


echo "Creating universal framework wait for while.....Will come back"

xcodebuild -create-xcframework -framework ${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework -framework ${IOS_DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework -framework ${CATALYST_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework -output "${FRAMEWORK_PATH}"



rm -rf "${SIMULATOR_ARCHIVE_PATH}"
rm -rf "${IOS_DEVICE_ARCHIVE_PATH}"
rm -rf "${CATALYST_ARCHIVE_PATH}"

open "${WORKING_DIR}/${FRAMEWORK_FOLDER_NAME}"

Distributing Your XCFramework Using Swift Package Manager and Xcode12
When XCFrameworks were first introduced by Apple, they were incompatible with Swift Package Manager. Now, with Xcode 12, you can distribute your Swift Packages as XCFramework binaries through Swift Package Manager.

This provides numerous advantages to you and the consumer. It allows you to keep your source code private and doesn't restrict your package r
