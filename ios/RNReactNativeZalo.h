
#import <React/RCTBridgeModule.h>

@interface RNReactNativeZalo : NSObject <RCTBridgeModule>

- (void)initWithZaloId:(NSString *)zaloId;
- (void)login: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback;
- (void)checkZaloOAuthCode: (NSString *)code successCallback: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback;
- (void)logout;
- (void)getZaloUserProfile: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback;
@end

