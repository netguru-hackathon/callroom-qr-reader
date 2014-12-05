//
//  CRRHTTPRequestOperationManager.h
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "Typedefs.h"

#define CRRNetworkManager [CRRHTTPRequestOperationManager sharedInstance]

@interface CRRHTTPRequestOperationManager : AFHTTPRequestOperationManager

+ (instancetype)sharedInstance;

- (void)requestWithPOST:(NSDictionary *)parameters path:(NSString *)path success:(CRRObjectBlock)success failure:(CRRErrorBlock)failure;
- (void)requestWithGET:(NSString *)query path:(NSString *)path success:(CRRObjectBlock)success failure:(CRRErrorBlock)failure;

- (void)setTokenForAuthorizationHeader:(NSString *)token tokenType:(NSString *)tokenType;

@property (nonatomic, strong) NSString *serverURL;

@end