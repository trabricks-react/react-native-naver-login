
# Naver Login For React Native  (네이버 아이디로 로그인 / 네아로)

![platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS-brightgreen.svg?style=flat-square&colorB=191A17)
[![npm](https://img.shields.io/npm/v/react-native-ccs-naver-login.svg?style=flat-square)](https://www.npmjs.com/package/react-native-ccs-naver-login)
[![npm](https://img.shields.io/npm/dm/react-native-ccs-naver-login.svg?style=flat-square&colorB=007ec6)](https://www.npmjs.com/package/react-native-ccs-naver-login)
[![github issues](https://img.shields.io/github/issues/creamcookie/react-native-naver-login.svg?style=flat-square)](https://github.com/creamcookie/react-native-naver-login/issues)
[![github closed issues](https://img.shields.io/github/issues-closed/creamcookie/react-native-naver-login.svg?style=flat-square&colorB=44cc11)](https://github.com/creamcookie/react-native-naver-login/issues?q=is%3Aissue+is%3Aclosed)
[![Issue Stats](https://img.shields.io/issuestats/i/github/creamcookie/react-native-naver-login.svg?style=flat-square&colorB=44cc11)](http://github.com/creamcookie/react-native-naver-login/issues)

## Getting started

`$ npm install react-native-ccs-naver-login --save`

### Mostly automatic installation

`$ react-native link react-native-ccs-naver-login`

### Manual installation


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
    

### Initalizing project


#### iOS (Without Cocoapods)



#### iOS (With Cocoapods)


#### Android



## Usage
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
  
