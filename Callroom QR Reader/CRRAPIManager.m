//
//  CRRAPIManager.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRAPIManager.h"
#import "Defines.h"
#import "CRRHTTPRequestOperationManager.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

@implementation CRRAPIManager

+ (void)setupAPIWithToken:(GTMOAuth2Authentication *)token {

    [CRRNetworkManager setServerURL:@"https://www.googleapis.com/calendar/v3"];
    [CRRNetworkManager setTokenForAuthorizationHeader:token.parameters[@"access_token"] tokenType:token.parameters[@"token_type"]];
}

+ (void)calendarListWithSuccess:(CRRArrayBlock)success failure:(CRRErrorBlock)failure {
    
    NSString *query = [NSString stringWithFormat:@"key=%@", kClientId];
    
    [CRRNetworkManager requestWithGET:query path:@"users/me/calendarList" success:^(id object) {
        //parse here objects to array and return success()
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
