
#react-native-zalo

## Cài đặt thư viện

`$ npm install react-native-zalo --save`

### Tự động link

`$ react-native link react-native-zalo`

### Cài đặt thư viện thủ công

Hướng dẫn tự tay link thư viện vào project thay vì chạy command link tự động. 

#### iOS

1. Mở Xcode, chọn tab Project navigator, nhấp chuột phải vào `Libraries` ➜ `Add Files to [your project's name]`
2. Đi đến thư mục `node_modules` ➜ `react-native-zalo` and add `RNReactNativeZAddalo.xcodeproj`
3. Mở XCode, chọn tab Project navigator, chọn project của bạn. Thêm (Add) `libRNZalo.a` vào phần `Build Phases` ➜ `Link Binary With Libraries`
4. Chạy rần rần, hết hồn! (`Cmd+R`)

#### Android

1. Mở file `android/app/src/main/java/[...]/MainActivity.java`
  - Thêm `import com.reactlibrary.RNZaloPackage;` vào.
  - Thêm `new RNZaloPackage()` vào danh sách được trả về từ hàm `getPackages()`.
2. Thêm code bên dưới ở file `android/settings.gradle`:
  	```
  	include ':react-native-zalo'
  	project(':react-native-zalo').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-zalo/android')
  	```
3. Thêm code bên dướic vào phần dependencies ở file `android/app/build.gradle`:
  	```
      compile project(':react-native-zalo')
  	```
## Khởi tạo ZaloSDK

#### iOS
#####  Đăng ký Zalo Id
- Cách 1: Mở file `AppDelegate.m` trong project ios của bạn, thêm code bên dưới
```swift
    [ZaloSDK sharedInstance initializeWithAppId:Zalo_ID_của_bạn];
```
Ví dụ code đầy đủ
```swift
    - (BOOL)application:(UIApplication *)application
     didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     
        [ZaloSDK sharedInstance initializeWithAppId:Zalo_ID_của_bạn];
        return YES;
    }
```

- Cách 2: Sử dụng hàm khởi tạo của thư viện, gọi hàm khởi tạo trước khi ứng dụng chạy (có thể là file index.js)
```swift
   import RNZalo from 'react-native-zalo';
   
   RNZalo.initWithZaloId(Zalo_ID_của_bạn);
```


## Sử dụng
```javascript
import RNZalo from 'react-native-zalo';

// TODO: What to do with the module?
RNZalo;
```
  