//
//  LoginViewController.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRLoginViewController.h"
#import "CRRLoginView.h"
#import <GooglePlus/GooglePlus.h>

static NSString * const kClientId = @"481541711545-31kbrp5pknl0p4ggiof53ocibmg01vmj.apps.googleusercontent.com";

@interface CRRLoginViewController () <GPPSignInDelegate>

@property (nonatomic, weak) CRRLoginView *aView;

@end

@implementation CRRLoginViewController

- (void)loadView {
    CRRLoginView *view = [[CRRLoginView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    _aView = view;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_aView.signInButton addTarget:self action:@selector(signInButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
    signIn.shouldFetchGoogleUserEmail = YES;
    
    signIn.clientID = kClientId;
    signIn.scopes = @[@"profile"];
//    signIn.scopes = @[@"https://www.googleapis.com/auth/calendar", @"https://www.googleapis.com/auth/plus.login"];
    
    signIn.delegate = self;
}

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error {
    
}

#pragma mark UIControl Methods
- (void)signInButtonDidClick:(GPPSignInButton *)button {
    
    [[GPPSignIn sharedInstance] authenticate];
}

@end
