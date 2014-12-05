//
//  ViewController.m
//  Callroom QR Reader
//
//  Created by Michał Kaźmierczak on 29.11.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeReaderViewController.h"
#import "GoogleOpenSource/GoogleOpenSource.h"

#define CLIEND_ID @"INSERT YOUR CLIENTID HERE"

static NSString * const kClientId = CLIEND_ID;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
    
    signIn.clientID = kClientId;
    signIn.scopes = @[ @"profile" ];
    
    // Optional: declare signIn.actions, see "app activities"
    signIn.delegate = self;

    [signIn authenticate];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
