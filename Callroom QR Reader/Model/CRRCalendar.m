//
//  CRRCalendar.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRCalendar.h"

@implementation CRRCalendar

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"accessRole" : @"accessRole",
             @"name" : @"description",
             @"etag" : @"etag",
             @"identifier" : @"id",
             @"kind" : @"kind",
             @"summary" : @"summary",
             @"timezone" : @"timeZone"};
}

@end
