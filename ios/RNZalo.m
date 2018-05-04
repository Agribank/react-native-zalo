
#import "RNZalo.h"
#include <ZaloSDK/ZaloSDK.h>

@implementation RNZalo

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
                                                             
                                                             NSMutableDictionary *userObj = [[NSMutableDictionary alloc] init];
                                                             [userObj setObject:response.oauthCode.length ? response.oauthCode : @"" forKey:@"oauthCode"];
                                                             [userObj setObject:response.userId.length ? response.userId : @""  forKey:@"userId"];
                                                             [userObj setObject:response.displayName.length ? response.displayName : @"" forKey:@"displayName"];
                                                             [userObj setObject:response.phoneNumber.length ? response.phoneNumber : @"" forKey:@"phoneNumber"];
                                                             [userObj setObject:response.dob.length ? response.dob : @"" forKey:@"dob"];
                                                             [userObj setObject:response.gender.length ? response.gender : @"" forKey:@"gender"];
                                                             
                                                             successCallback(@[userObj]);
                                                         } else {
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


