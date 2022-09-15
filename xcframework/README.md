# SwiftStaticLib

# How to compile in Same. a file or framework file in M1 and Intel Simulator?

1.    When we compile SDK in M1 and Intel system by selecting device will not get any issue. Because device have same architecture for device called arm64 
2.    We will only face issue in Simulator M1 and Intel. 
3.    Intel simulator run on x84_64 and M1 Simulator run on arm64.
4.    We can create single framework called xcframework, which will contain x84_64, arm64 for device, arm64 from simulator m1 
5.    We can achieve this running few commands


# Create framework with release script file path scripts/

1. select universal target(JfrogSDKUni)-> Build
2. Wait for while .xc framdwork will be created at project path 


# Create framework with manual Commands on terminal

1.    Archive for Intel simulator and M1 simulator with respective arch
Before these command 
We have to do 

Project target-> Build settings-> BUILD_LIBRARY_FOR_DISTRIBUTION = YES
Project target-> Build settings-> Skip Install = NO

At Path JFrogSDK 

** Step 1. Create simulator archive for arch x86_64 and arm64

xcodebuild archive \
-scheme JFrogSDK \
-archivePath ./builds/sim-x86_64-arm64.xcarchive \ 
-sdk iphonesimulator \
-arch arm64 -arch x86_64 \
SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


** Step 2. Create simulator archive for arch arm64

xcodebuild archive \
-scheme JFrogSDK \
-archivePath ./builds/ios-arm64.xcarchive \ 
-sdk iphoneos \
-arch arm64 \
SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

** Step 3. Get frame from achive package and below folders before step  4

 Builds/sim-x86_64-arm64.xcarchive/ Show package content product ... get framwork
 Builds/ios-arm64.xcarchive/ Show package content product ... get framwork
 
Create one folder called Frameworks/sim-Intel-M1
Create one folder called Frameworks/ios

**Step 4 Create XC framework from simulator arch x86_64 and arm64

xcodebuild -create-xcframework -framework ./builds/Frameworks/ios/JFrogSDK.framework -framework ./builds/Frameworks/sim-Intel-M1/JFrogSDK.framework -output ./builds/Frameworks/JFrogSDK.xcframework


** JFrogSDK.xcframework framework will be created succesfully at this path /builds/Frameworks/JFrogSDK.xcframework


** FAQ

If you are getting below error just ignote

Requested but did not find extension point with identifier Xcode.IDEKit.ExtensionSentinelHostApplications for extension Xcode.DebuggerFoundation.AppExtensionHosts.watchOS of plug-in com.apple.dt.IDEWatchSupportCore
2022-09-09 13:00:23.446 xcodebuild[35874:5285241] Requested but did not find extension point with identifier Xcode.IDEKit.ExtensionPointIdentifierToBundleIdentifier for extension Xcode.DebuggerFoundation.AppExtensionToBundleIdentifierMap.watchOS of plug-in com.apple.dt.IDEWatchSupportCore


if your getting error swift interface package missing 

Do this and again start from step 1

Project target-> Build settings-> BUILD_LIBRARY_FOR_DISTRIBUTION = YES
Project target-> Build settings-> Skip Install = NO
