
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <NaverThirdPartyLogin/NaverThirdPartyLogin.h>

@interface RNCNaverLogin : NSObject <RCTBridgeModule, NaverThirdPartyLoginConnectionDelegate> {
    
    NaverThirdPartyLoginConnection *_thirdPartyLoginConn;
    
    RCTPromiseResolveBlock _resolve;
    RCTPromiseRejectBlock _reject;
    
    BOOL _afterlogin;
    
}

+ (BOOL)isLoginCallback:(NSURL *)url;

@end
  
