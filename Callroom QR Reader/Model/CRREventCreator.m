//
//  CRREventCreator.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRREventCreator.h"

@implementation CRREventCreator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"name" : @"displayName",
             @"email" : @"email"};
}

@end
