
#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif

@interface RNZalo : NSObject <RCTBridgeModule>

- (void)initWithZaloId:(NSString *)zaloId;
- (void)login: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback;
- (void)checkZaloOAuthCode: (NSString *)code successCallback: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback;
- (void)logout;
- (void)getZaloUserProfile: (RCTResponseSenderBlock)successCallback failureCallback: (RCTResponseErrorBlock)failureCallback;

@end
