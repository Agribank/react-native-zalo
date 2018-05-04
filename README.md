#react-native-zalo

## Cài đặt thư viện


`$ npm install --save react-native-zalo `



`$ yarn add react-native-zalo `

## Cài đặt Zalo SDK
Thêm câu  bên dưới vào script object ở file package.json 

```text
"scripts": {
    ...
    "zalo": "chmod +x node_modules/react-native-zalo/scripts/setup.sh && node_modules/react-native-zalo/scripts/setup.sh RNZaloExample"
}
  ```
  
Chạy câu lệnh `npm run zalo` hoặc `yarn zalo` để cài đặt Zalo SDK


##Code ví dụ

```js
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';

import RNZalo from 'react-native-zalo';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {
  componentDidMount() {
    // BẮT BUỘC PHẢI SET ZALO APP ID TRƯỚC TIÊN 
    RNZalo.initWithZaloId('3642718214395550655');
    
    // RỒI SAU ĐÓ MUỐN LÀM GÌ LÀM 
    RNZalo.login(this._success, this._faiulre);
  }

  _success = (authCode) => {
    console.log(authCode);
  };

  _faiulre = () => {
    console.log('failure');
  };

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit App.js
        </Text>
        <Text style={styles.instructions}>
          {instructions}
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
```