
#import "RNCNaverLogin.h"


@implementation RNCNaverLogin

- (dispatch_queue_t)methodQueue
{
    [self initThirdParty];
    return dispatch_get_main_queue();
}

- (void)initThirdParty {
    if (_thirdPartyLoginConn != NULL) return;
    
    _thirdPartyLoginConn = [NaverThirdPartyLoginConnection getSharedInstance];
    [_thirdPartyLoginConn setIsNaverAppOauthEnable:YES];
    [_thirdPartyLoginConn setIsInAppOauthEnable:YES];

    [_thirdPartyLoginConn setOnlyPortraitSupportInIphone:YES];
    [_thirdPartyLoginConn setAppName: [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]];
    [_thirdPartyLoginConn setServiceUrlScheme:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"NAVER_USE_SCHEMES"]];
    [_thirdPartyLoginConn setConsumerKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"NAVER_CLIENT_ID"]];
    [_thirdPartyLoginConn setConsumerSecret:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"NAVER_CLIENT_SECRET"]];
    
    [_thirdPartyLoginConn setDelegate:self];
}


- (BOOL)isLogin
{
    [self initThirdParty];
    return NO != [_thirdPartyLoginConn isValidAccessTokenExpireTimeNow];
}

- (NSDictionary *)getAccessToken
{
    [self initThirdParty];
    if ([self isLogin]) {
        NSDictionary * result = @{ @"accessToken": _thirdPartyLoginConn.accessToken,
                                   @"expireAt": _thirdPartyLoginConn.accessTokenExpireDate
                                   };

        return result;
    }
    else {
        return nil;
    }
}

+ (BOOL) isLoginCallback:(NSURL *) url {
    NSString *schemeConf = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NAVER_USE_SCHEMES"];
    return [schemeConf isEqual:url.scheme];
}


RCT_EXPORT_MODULE()


RCT_REMAP_METHOD(getAccessToken,
                 accessTokenWithResolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject) {
    
    [self initThirdParty];
    @try {
        resolve([self getAccessToken]);
    }
    @catch(NSException * e) {
        NSLog(@"%@", e);
        NSLog(@"ERRORR....");
        reject(@"RNCNaverLogin", e.userInfo.description, nil);
    }
}

RCT_REMAP_METHOD(login,
                 loginWithResolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject) {

    _resolve = resolve;
    _reject  = reject;
    
    if ([self isLogin]) {
        _afterlogin = YES;
        [_thirdPartyLoginConn requestDeleteToken];
    }
    else {
        [_thirdPartyLoginConn requestThirdPartyLogin];
    }
    
}

RCT_REMAP_METHOD(logout,
                 logoutWithResolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject) {
    
    [self initThirdParty];
    _afterlogin = NO;
    _resolve = resolve;
    _reject  = reject;
    [_thirdPartyLoginConn requestDeleteToken];
}

#pragma mark - NaverThirdPartyLoginConnectionDelegate

- (void)oauth20ConnectionDidOpenInAppBrowserForOAuth:(NSURLRequest *)request {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NLoginThirdPartyOAuth20InAppBrowserViewController *inappAuthBrowser = [[NLoginThirdPartyOAuth20InAppBrowserViewController alloc] initWithRequest:request];
        UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (topController.presentedViewController) {
            topController = topController.presentedViewController;
        }
        [topController presentViewController:inappAuthBrowser animated:YES completion:nil];
    });
    //    [self presentWebviewControllerWithRequest:request];
}


- (void)oauth20ConnectionDidFinishRequestACTokenWithAuthCode {
    if (_resolve) {
        _resolve([self getAccessToken]);
        _reject = nil;
        _resolve = nil;
        _afterlogin = NO;
    }
    
}


- (void)oauth20ConnectionDidFinishRequestACTokenWithRefreshToken {
    if (_resolve) {
        _resolve([self getAccessToken]);
        _reject = nil;
        _resolve = nil;
        _afterlogin = NO;
    }
}


- (void)oauth20ConnectionDidFinishDeleteToken {
    if (_afterlogin) {
        _afterlogin = NO;
        [self loginWithResolver:_resolve rejecter:_reject];
    }
    else if (_resolve) {
        _resolve(@"SUCCESS");
        _reject = nil;
        _resolve = nil;
        _afterlogin = NO;
    }
}


- (void)oauth20Connection:(NaverThirdPartyLoginConnection *)oauthConnection didFailWithError:(NSError *)error {
    if (_reject) {
        _reject(@"RNCNaverLogin", error.userInfo.description, nil);
        _reject = nil;
        _resolve = nil;
        _afterlogin = NO;
    }
}

- (void)oauth20Connection:(NaverThirdPartyLoginConnection *)oauthConnection didFailAuthorizationWithRecieveType:(THIRDPARTYLOGIN_RECEIVE_TYPE)recieveType
{
    if (_reject) {
        _reject(@"RNCNaverLogin", [NSString stringWithFormat: @"%d", recieveType], nil);
        _reject = nil;
        _resolve = nil;
        _afterlogin = NO;
    }
    
}

- (void)oauth20Connection:(NaverThirdPartyLoginConnection *)oauthConnection didFinishAuthorizationWithResult:(THIRDPARTYLOGIN_RECEIVE_TYPE)recieveType
{
    if (_resolve) {
        _resolve([self getAccessToken]);
        _reject = nil;
        _resolve = nil;
        _afterlogin = NO;
    }
}


@end
  
