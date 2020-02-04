# Type a script or drag a script file from yo######################
# Options
######################

REVEAL_ARCHIVE_IN_FINDER=false

FRAMEWORK_NAME="${PROJECT_NAME}"

SIMULATOR_LIBRARY_PATH="${BUILD_DIR}/${CONFIGURATION}-iphonesimulator"

DEVICE_LIBRARY_PATH="${BUILD_DIR}/${CONFIGURATION}-iphoneos"

UNIVERSAL_LIBRARY_DIR="Universal"

FRAMEWORK="${UNIVERSAL_LIBRARY_DIR}"


######################
# Build Frameworks
######################
#xcodebuild clean build CONFIGURATION_BUILD_DIR="${BUILD_DIR}/${CONFIGURATION}-iphoneos" -scheme "${PROJECT_NAME}" -sdk iphonesimulator -configuration {CONFIGURATION} OBJROOT="${OBJROOT}/DependentBuilds"
#xcodebuild clean build CONFIGURATION_BUILD_DIR="${BUILD_DIR}/${CONFIGURATION}-iphonesimulator" -scheme "${PROJECT_NAME}" -sdk iphoneos -configuration ${CONFIGURATION} OBJROOT="${OBJROOT}/DependentBuilds"

xcodebuild -target "${PROJECT_NAME}" -scheme "${PROJECT_NAME}" -sdk iphonesimulator -configuration ${CONFIGURATION} OBJROOT="${OBJROOT}/DependentBuilds"

xcodebuild -target "${PROJECT_NAME}" -scheme "${PROJECT_NAME}" -sdk iphoneos -configuration ${CONFIGURATION}  OBJROOT="${OBJROOT}/DependentBuilds"

######################
# Create directory for universal
######################

rm -rf "${UNIVERSAL_LIBRARY_DIR}"

#mkdir "${UNIVERSAL_LIBRARY_DIR}"

if [ ! -d "${UNIVERSAL_LIBRARY_DIR}" ]; then
mkdir "${UNIVERSAL_LIBRARY_DIR}"
# Control will enter here if $DIRECTORY doesn't exist.
fi
#mkdir "${FRAMEWORK}"
if [ ! -d "${FRAMEWORK}" ]; then
mkdir "${FRAMEWORK}"
# Control will enter here if $DIRECTORY doesn't exist.
fi

######################
# Copy files Framework
######################

#cp -r "${DEVICE_LIBRARY_PATH}/." "${FRAMEWORK}"


######################
# Make an universal binary
######################

lipo "${SIMULATOR_LIBRARY_PATH}/lib${FRAMEWORK_NAME}.a" "${DEVICE_LIBRARY_PATH}/lib${FRAMEWORK_NAME}.a" -create -output "${FRAMEWORK}/lib${FRAMEWORK_NAME}.a" | echo
#ur workspace to insert its path.


