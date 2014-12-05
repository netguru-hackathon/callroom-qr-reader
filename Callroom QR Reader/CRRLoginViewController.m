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
#import <GoogleOpenSource/GoogleOpenSource.h>
#import "Defines.h"
#import "CRRAPIManager.h"
#import "CRRCalendarSelectorViewController.h"

@interface CRRLoginViewController () <GPPSignInDelegate>

@property (nonatomic, weak) CRRLoginView *aView;
@property (nonatomic, strong) GTMOAuth2Authentication *auth;

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
    signIn.scopes = @[@"https://www.googleapis.com/auth/calendar", @"https://www.googleapis.com/auth/plus.login"];
    
    signIn.delegate = self;
}

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error {

    [CRRAPIManager setupAPIWithToken:auth];
    [CRRAPIManager calendarListWithSuccess:^(NSArray *array) {
        
        CRRCalendarSelectorViewController *controller = [[CRRCalendarSelectorViewController alloc] initWithModel:array];
        [self.navigationController pushViewController:controller animated:YES];
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark UIControl Methods
- (void)signInButtonDidClick:(GPPSignInButton *)button {

}

@end
