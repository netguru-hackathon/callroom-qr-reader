//
//  CRREvent.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRREvent.h"

@implementation CRREvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"creator" : @"creator",
             @"createdAt" : @"created",
             @"updatedAt" : @"updated",
             @"info" : @"description",
             @"startDate" : @"start",
             @"endDate" : @"end",
             @"status" : @"status",
             @"summary" : @"summary",
             @"htmlLink" : @"htmlLink",
             @"identifier" : @"id"};
}

+ (NSValueTransformer *)creatorJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^CRREventCreator *(NSDictionary *creator) {
        return [MTLJSONAdapter modelOfClass:[CRREventCreator class] fromJSONDictionary:creator error:NULL];
    }];
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^NSString *(NSDictionary *end) {
        return [self GMTTimeWithTime:end[@"dateTime"]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^NSString *(NSDictionary *start) {
        return [self GMTTimeWithTime:start[@"dateTime"]];
    }];
}

+ (NSString *)GMTTimeWithTime:(NSString *)time {
    NSString *string = [time componentsSeparatedByString:@"T"][1];
    string = [string componentsSeparatedByString:@"-"][0];
    NSString *hour = [NSString stringWithFormat:@"%02d", [[string substringToIndex:2] integerValue] + 9];
    return [string stringByReplacingCharactersInRange:NSMakeRange(0, 2) withString:hour];
}

@end
