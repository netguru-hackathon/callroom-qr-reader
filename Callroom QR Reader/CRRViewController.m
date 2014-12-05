//
//  ViewController.m
//  Callroom QR Reader
//
//  Created by Michał Kaźmierczak on 29.11.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRViewController.h"
#import "QRCodeReaderViewController.h"
#import "GoogleOpenSource/GoogleOpenSource.h"
#import <GooglePlus/GooglePlus.h>

static NSString * const kClientId = @"481541711545-31kbrp5pknl0p4ggiof53ocibmg01vmj.apps.googleusercontent.com";

@interface CRRViewController () <GPPSignInDelegate, QRCodeReaderDelegate>

@end

@implementation CRRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    GPPSignIn *signIn = [GPPSignIn sharedInstance];
//    signIn.shouldFetchGooglePlusUser = YES;
//    signIn.shouldFetchGoogleUserEmail = YES;
//    
//    signIn.clientID = kClientId;
//    signIn.scopes = @[ @"profile" ];
//    
//    // Optional: declare signIn.actions, see "app activities"
//    signIn.delegate = self;
//
//    [signIn authenticate];
}

- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error {
    NSLog(@"Received error %@ and auth object %@",error, auth);
    if (error) {
        // Do some error handling here.
    } else {
    }
}



- (void)presentSignInViewController:(UIViewController *)viewController {
    // This is an example of how you can implement it if your app is navigation-based.
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)scanAction:(id)sender
{
    QRCodeReaderViewController *reader = [QRCodeReaderViewController new];
    reader.modalPresentationStyle      = UIModalPresentationFormSheet;
    
    // Using delegate methods
    reader.delegate                    = self;
    
    [self presentViewController:reader animated:YES completion:NULL];
}

#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"%@", result);
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
