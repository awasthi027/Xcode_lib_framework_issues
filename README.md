# SwiftStaticLib

# How to compile in Same. a file and framework file in M1 and Intel Simulator?

1.    When we compile SDK in M1 and Intel system by selecting device will not get any issue. Because device have same architecture for device called arm64 
2.    We will only face issue in Simulator M1 and Intel. 
3.    Intel simulator run on x84_64 and M1 Simulator run on arm64.
4.    We can create single framework called xcframework, which will contain x84_64, arm64 for device, arm64 from simulator m1 
5.    We can achieve this running few commands


# Create framework with release script file 

1. select universal target(JfrogSDKUni)-> Build
2. Wait for while .xc framdwork will be created at project path 


# Create framework with manual Commands on terminal

1.    Archive for Intel simulator and M1 simulator with respective arch
Before these command 
We have to do 

Project target-> Build settings-> BUILD_LIBRARY_FOR_DISTRIBUTION = YES
Project target-> Build settings-> Skip Install = NO


xcodebuild archive \
-scheme schemaName \
-archivePath ../builds/schemaName-simu -x86_64.xcarchive \
-sdk iphonesimulator \
-arch arm64 -arch x86_64

xcodebuild archive \
-scheme schemaName \
-archivePath ../builds/schemaName -iphone-arm64.xcarchive \
-sdk iphoneos \
-arch arm64

