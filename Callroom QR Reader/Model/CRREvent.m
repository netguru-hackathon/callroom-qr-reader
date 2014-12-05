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
        return end[@"date"];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^NSString *(NSDictionary *start) {
        return start[@"date"];
    }];
}

@end
