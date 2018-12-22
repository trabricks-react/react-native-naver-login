
# react-native-ccs-naver-login

## Getting started

`$ npm install react-native-ccs-naver-login --save`

### Mostly automatic installation

`$ react-native link react-native-ccs-naver-login`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-ccs-naver-login` and add `RNCcsNaverLogin.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCcsNaverLogin.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCcsNaverLoginPackage;` to the imports at the top of the file
  - Add `new RNCcsNaverLoginPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-ccs-naver-login'
  	project(':react-native-ccs-naver-login').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-ccs-naver-login/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-ccs-naver-login')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNCcsNaverLogin.sln` in `node_modules/react-native-ccs-naver-login/windows/RNCcsNaverLogin.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Ccs.Naver.Login.RNCcsNaverLogin;` to the usings at the top of the file
  - Add `new RNCcsNaverLoginPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNCcsNaverLogin from 'react-native-ccs-naver-login';

// TODO: What to do with the module?
RNCcsNaverLogin;
```
  