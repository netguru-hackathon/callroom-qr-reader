//
//  CRREvent.h
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

#import "CRREventCreator.h"

@interface CRREvent : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) CRREventCreator *creator;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *info;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSNumber *summary;
@property (nonatomic, strong) NSString *htmlLink;
@property (nonatomic, strong) NSString *identifier;


@end
