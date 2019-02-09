
# Naver Login For React Native  (네이버 아이디로 로그인 / 네아로)

![platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS-brightgreen.svg?style=flat-square&colorB=191A17)
[![npm](https://img.shields.io/npm/v/react-native-ccs-naver-login.svg?style=flat-square)](https://www.npmjs.com/package/react-native-ccs-naver-login)
[![npm](https://img.shields.io/npm/dm/react-native-ccs-naver-login.svg?style=flat-square&colorB=007ec6)](https://www.npmjs.com/package/react-native-ccs-naver-login)
[![github issues](https://img.shields.io/github/issues/creamcookie/react-native-naver-login.svg?style=flat-square)](https://github.com/creamcookie/react-native-naver-login/issues)
[![github closed issues](https://img.shields.io/github/issues-closed/creamcookie/react-native-naver-login.svg?style=flat-square&colorB=44cc11)](https://github.com/creamcookie/react-native-naver-login/issues?q=is%3Aissue+is%3Aclosed)
[![Issue Stats](https://img.shields.io/issuestats/i/github/creamcookie/react-native-naver-login.svg?style=flat-square&colorB=44cc11)](http://github.com/creamcookie/react-native-naver-login/issues)

## 시작하기

`$ npm install react-native-ccs-naver-login --save`

### 자동설치

`$ react-native link react-native-ccs-naver-login`


### 수동설치

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-ccs-naver-login` and add `RNCNaverLogin.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCNaverLogin.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import cc.creamcookie.rn.naver.login.RNCNaverLoginPackage;` to the imports at the top of the file
  - Add `new RNCNaverLoginPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-ccs-naver-login'
  	project(':react-native-ccs-naver-login').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-ccs-naver-login/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-ccs-naver-login')
  	```
    


### 설치 후 부가 작업 (필수)

#### iOS (Without Cocoapods)

1. Download to SDK (NaverThirdPartyLogin.framework)
   https://github.com/naver/naveridlogin-sdk-ios
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. import a NaverThirdPartyLogin.framework

#### iOS (With Cocoapods)

1. Nothing.

#### Android

1. Nothing.



### 키 설정 등 작업

#### iOS
1. Open a Info.plist
2. 

#### Android
1. Open a AndroidManifest.xml
2. 


사용방법은 
https://github.com/creamcookie/react-native-naver-login
안에 example프로젝트를 참고하시면됩니다.


## 기본 사용방법
```javascript
import NaverLogin from 'react-native-ccs-naver-login';

// TODO: What to do with the module?
NaverLogin.login()
  .then(res => {
    alert("Signed Successful\n" + res.accessToken);
  }).catch(e => {
    alert("Signed Failure");
  });
```
  
