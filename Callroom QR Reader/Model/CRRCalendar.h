//
//  CRRCalendar.h
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface CRRCalendar : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *accessRole;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *timezone;

@end
