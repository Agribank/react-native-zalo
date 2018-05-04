#react-native-zalo

## Cài đặt thư viện


`$ npm install --save react-native-zalo `



`$ yarn add react-native-zalo `

## Cài đặt Zalo SDK
Thêm câu  bên dưới vào script object ở file package.json 

```text
"scripts": {
    ...
    "zalo": "chmod +x node_modules/react-native-zalo/scripts/setup.sh && node_modules/react-native-zalo/scripts/setup.sh YOUR_TARGET_PROJECT_NAME"
}
  ```
  
Chạy câu lệnh `npm run zalo` hoặc `yarn zalo` để cài đặt Zalo SDK
