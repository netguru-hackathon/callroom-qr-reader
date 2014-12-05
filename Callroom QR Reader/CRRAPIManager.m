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

#import "CRRCalendar.h"
#import "CRREvent.h"

@implementation CRRAPIManager

static inline NSString * key() {
    return [NSString stringWithFormat:@"key=%@", kClientId];
}

+ (void)setupAPIWithToken:(GTMOAuth2Authentication *)token {

    [CRRNetworkManager setServerURL:@"https://www.googleapis.com/calendar/v3"];
    [CRRNetworkManager setTokenForAuthorizationHeader:token.parameters[@"access_token"] tokenType:token.parameters[@"token_type"]];
}

+ (void)calendarListWithSuccess:(CRRArrayBlock)success failure:(CRRErrorBlock)failure {
    
    [CRRNetworkManager requestWithGET:key() path:@"users/me/calendarList" success:^(NSDictionary *response) {

        NSArray *items = [MTLJSONAdapter modelsOfClass:[CRRCalendar class] fromJSONArray:response[@"items"] error:NULL];
        success(items);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)calendarEventsWithCalendar:(CRRCalendar *)calendar success:(CRRArrayStringBlock)success failure:(CRRErrorBlock)failure {
    
    NSString *timeMin = @"2014-12-05T00:00:00-04:00";//@"2014-12-05T00:00:00Z";
    NSString *timeMax = @"2014-12-06T23:59:59-04:00";//@"2014-12-06T00:00:00Z";
    
    NSString *path = [NSString stringWithFormat:@"calendars/%@/events", calendar.identifier];
    NSString *query = [NSString stringWithFormat:@"%@&&timeMin=%@&timeMax=%@&singleEvents=true", key(), timeMin, timeMax];
    
    [CRRNetworkManager requestWithGET:query path:path success:^(NSDictionary *response) {
        
        NSArray *array = [MTLJSONAdapter modelsOfClass:[CRREvent class] fromJSONArray:response[@"items"] error:NULL];
        success(array, response[@"summary"]);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}


@end
