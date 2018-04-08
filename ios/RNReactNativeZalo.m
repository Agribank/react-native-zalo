
#import "RNReactNativeZalo.h"
#import <ZaloSDK/ZaloSDK.h>

@implementation RNReactNativeZalo

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(initWithZaloId:(NSString *)zaloId)
{
    [[ZaloSDK sharedInstance] initializeWithAppId:zaloId];
}

RCT_EXPORT_METHOD(login: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback)
{
    [[ZaloSDK sharedInstance] authenticateZaloWithAuthenType:ZAZaloSDKAuthenTypeViaZaloAppOnly
                                            parentController:[[UIViewController alloc] initWithNibName:@"RNZaloViewController" bundle:nil]                        //controller hiện form đăng nhập
                                                     handler:^(ZOOauthResponseObject *response) { //callback kết quả đăng nhập
                                                         if([response isSucess]) {
                                                             // đăng nhập thành công
                                                             NSString *oauthCode = response.oauthCode;
                                                             // có thể dùng oauth code này để verify lại từ server của ứng dụng
                                                             successCallback(@[oauthCode]);
                                                         } else if(response.errorCode != kZaloSDKErrorCodeUserCancel) {
                                                             //lỗi đăng nhập
                                                             failureCallback(
                                                                             [[NSError alloc] initWithDomain:@"Zalo Oauth" code:response.errorCode userInfo:@{
                                                                                                                                                             @"message": response.errorMessage}]
                                                             );
                                                         }
                                                     }];
}

RCT_EXPORT_METHOD(checkZaloOAuthCode: (NSString *)code successCallback: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback) {
    [[ZaloSDK sharedInstance] isAuthenticatedZaloWithCompletionHandler:
    ^(ZOOauthResponseObject *response) {
        
        if(response.errorCode == kZaloSDKErrorCodeNoneError) {
            //Đã authenticate
            successCallback(@[@TRUE]);
        }
        else {
            failureCallback(
                            [[NSError alloc] initWithDomain:@"Zalo Oauth" code:response.errorCode userInfo:@{
                                                                                                             @"message": response.errorMessage}]
                            );
        }
    }];
}

RCT_EXPORT_METHOD(logout) {
    [[ZaloSDK sharedInstance] unauthenticate];
}

RCT_EXPORT_METHOD(getZaloUserProfile: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback) {
    [[ZaloSDK sharedInstance] getZaloUserProfileWithCallback:
     ^(ZOGraphResponseObject *response) {
         
         if(response.errorCode == kZaloSDKErrorCodeNoneError) {
             // Lấy profile thành công
             successCallback(@[response.data]);
         } else {
             failureCallback(
                             [[NSError alloc] initWithDomain:@"Zalo Oauth" code:response.errorCode userInfo:@{
                                                                                                              @"message": response.errorMessage}]
                             );
         }
     }];

}

@end

