//
//  CRRAPIManager.h
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  "Typedefs.h"

@class GTMOAuth2Authentication, CRRCalendar;

@interface CRRAPIManager : NSObject

+ (void)setupAPIWithToken:(GTMOAuth2Authentication *)token;
+ (void)calendarListWithSuccess:(CRRArrayBlock)success failure:(CRRErrorBlock)failure;
+ (void)calendarEventsWithCalendar:(CRRCalendar *)calendar success:(CRRArrayStringBlock)success failure:(CRRErrorBlock)failure;

@end
