#How to consume compiled framework from Jfrog artifactory.

## Example framework name: JFrogSDK
## Local host, Install Jfron on local machine

 ## Step 1. Create artifactory repository: Create new local repository ->Put repository key 

 ## Step 2. Left Top side option -> Set me Up -> select package manager -> select repository

 ## Step 3. if cocoapod-art gem is not install in your machine 
 
 install with below commands
 
 gem install cocoapods-art 

 or 

 gem install cocoapods-art -user -install 

 ## Step 4. Set Up Jfrog credential in file called  .netrc at your user path

 File path: Users/user 

  machine 127.0.0.1 // local host url 
  login admin // username
  password APAiMLATMqRwTgWfMVgRYdMZdHa // password

 ## Step 5. Deploy your compiled framework on jfrog artifactory

 bundle JFrogSDK.podspec and JFrogSDK.xframework in single  file 

 Example: 

 JFrogSDK.xcframework

JFrogSDK.podspec

JFrogSDK-(JFrogSDK.xcframework, JFrogSDK.podspec)

users/ashishawasthi/downloads

Run command from base folder path to create .tar.gz

gtar czvf JFrogSDK.tar.gz JFrogSDK

gtar not found. 

Install gtar  with this command:  brew install gnu-tar

## Step 6.  Deploy JFrogSDK.tar.gz on Artifactory 

curl --uadmin:<Encrypted Password> -XPUT http://127.0.0.1:8081/artifactory/repo_name/framework/framework_version/filename.tar.gz -T -T filename.tar.gz

curl -uadmin:APAiMLATMqRwTgWfMVgRYdMZdHa -XPUT http://127.0.0.1:8081/artifactory/jfrog-sdk/jfrog-sdk/1.0.0/frog-sdk.tar.gz -T jfrog-sdk.tar.gz

## Step 7. Add compiled framework in cocoapod-art by running this command

pod repo-art add jfrog-sdk "http://127.0.0.1:8081/artifactory/api/pods/jfrog-sdk"

## Step 8. 

Add in before before project target podfile

plugin 'cocoapods-art', :sources => [
  'jfrog-sdk'
]

Add in project target 

pod 'JFrogSDK' 

## Step 9

pod install

## More info 

More info: 

https://www.youtube.com/watch?v=6eiL3IaQG3Q

https://medium.com/@fullsour/installing-gnu-tar-on-mac-827a494b1c1

https://stackoverflow.com/questions/54189047/adding-a-fat-binary-framework-to-artifactory-cocoapods-repository
