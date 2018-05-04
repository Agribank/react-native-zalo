#!/usr/bin/env bash
export PROJECT_NAME=$1

cd ios/
touch Podfile
echo -n "" > Podfile

echo "
workspace 'RNZaloExample'


project '$PROJECT_NAME'
project '../node_modules/react-native-zalo/ios/RNZalo'

target '$PROJECT_NAME' do
    project '$PROJECT_NAME'
    pod 'ZaloSDK'
end

target 'RNZalo' do
    project '../node_modules/react-native-zalo/ios/RNZalo'
    pod 'ZaloSDK'
end
" >> Podfile

pod install

open -a Xcode RNZaloExample.xcworkspace
