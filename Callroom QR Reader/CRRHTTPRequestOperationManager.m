//
//  CRRHTTPRequestOperationManager.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRHTTPRequestOperationManager.h"

@implementation CRRHTTPRequestOperationManager

+ (instancetype)sharedInstance {
    static CRRHTTPRequestOperationManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        CRRHTTPRequestOperationManager *manager = [CRRHTTPRequestOperationManager manager];
        
        //request serializer:
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager setRequestSerializer:requestSerializer];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        [manager setResponseSerializer:responseSerializer];
        
        [manager.requestSerializer setValue:@"Google APIs Explorer" forHTTPHeaderField:@"X-JavaScript-User-Agent"];
        
        sharedInstance = manager;
    });
    return sharedInstance;
}

- (void)requestWithPOST:(NSDictionary *)parameters path:(NSString *)path success:(CRRObjectBlock)success failure:(CRRErrorBlock)failure {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self POST:[self urlWithPath:path query:nil] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        failure(error);
    }];
}

- (void)requestWithGET:(NSString *)query path:(NSString *)path success:(CRRObjectBlock)success failure:(CRRErrorBlock)failure {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self GET:[self urlWithPath:path query:query] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        failure(error);
    }];
}

- (void)setTokenForAuthorizationHeader:(NSString *)token tokenType:(NSString *)tokenType {
    NSString *string = [NSString stringWithFormat:@"%@ %@", tokenType, token];
    [[CRRHTTPRequestOperationManager sharedInstance].requestSerializer setValue:string forHTTPHeaderField:@"Authorization"];
}

- (NSString *)urlWithPath:(NSString *)path query:(NSString *)query {
    
    BOOL hasInvalidSyntax = (query && !path);
    NSAssert2(!hasInvalidSyntax, @"Query (%@) cannot exists without specified path(%@)", query, path);
    NSAssert(self.serverURL, @"Server URL path missing.");
    
    NSMutableString *url = [_serverURL mutableCopy];
    if (path) {
        [url appendFormat:@"/%@", path];
    }
    if (query) {
        [url appendFormat:@"?%@", query];
    }
    return [url copy]; //make it immutable
}

@end