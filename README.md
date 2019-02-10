
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

***** When not working
Add these pods in your Podfile and then install.

```
pod 'React', :path => '../node_modules/react-native', :subspecs => [ 'Core', 'CxxBridge', 'DevSupport', 'RCTText', 'RCTNetwork', 'RCTWebSocket', 'RCTAnimation', 'RCTImage', 'RCTLinkingIOS', ]
pod 'yoga', :path => '../node_modules/react-native/ReactCommon/yoga'
pod 'DoubleConversion', :podspec => '../node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
pod 'glog', :podspec => '../node_modules/react-native/third-party-podspecs/glog.podspec'
pod 'Folly', :podspec => '../node_modules/react-native/third-party-podspecs/Folly.podspec'
pod 'react-native-ccs-naver-login', :path => '../node_modules/react-native-ccs-naver-login'
```

#### Android

1. Nothing.



### 키 설정 등 작업

#### iOS
1. Open Info.plist and add your Naver Application information.

```xml
<key>NAVER_CLIENT_ID</key>
<string>YOUR_ID</string>
<key>NAVER_CLIENT_SECRET</key>
<string>YOUR_SECRET</string>
<key>NAVER_USE_SCHEMES</key>
<string>YOUR_SCHEME</string>
```

2. Add the URL Scheme in URL Types of Info tab.

#### Android
1. Open AndroidManifest.xml
2. Add your Naver ID and Secret Key inside of the <application> tag
  
```xml
<application
...
  <meta-data android:name="com.naver.sdk.ClientId" android:value="YOUR_KEY"/> 
  <meta-data android:name="com.naver.sdk.ClientSecret" android:value="YOUR_KEY" /> 
</application>
```

사용방법은 
https://github.com/creamcookie/react-native-naver-login
안에 example프로젝트를 참고하시면됩니다.


## 기본 사용방법
```javascript
import NaverLogin from 'react-native-ccs-naver-login';

// TODO: 로그인처리 (이미 로그인되어있어도 창 강제로 띠웁니다)
NaverLogin.login()
  .then(res => {
    alert("Signed Successful\n" + res.accessToken);
  }).catch(e => {
    alert("Signed Failure");
  });
  
// TODO: 로그아웃처리 
NaverLogin.logout();

// TODO: 토큰가져오기 (로그인안되어있음 안가져옴)
NaverLogin.getAccessToken()
  .then(res => {
    alert("Signed Successful\n" + res.accessToken);
  }).catch(e => {
    alert("Signed Failure");
  });

```
  
