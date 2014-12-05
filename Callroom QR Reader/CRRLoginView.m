//
//  LoginView.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRLoginView.h"
#import <GooglePlus/GooglePlus.h>

@implementation CRRLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _label = [[UILabel alloc] init];
        _label.text = @"Sign in with google+\nto start using app!";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        [self addSubview:_label];
        
        _signInButton = [[GPPSignInButton alloc] init];
        [self addSubview:_signInButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGSize buttonSize = CGSizeMake(200.0f, 40.0f);
    
    self.label.frame = CGRectMake(0.0f,
                                  0.0f,
                                  CGRectGetWidth(rect),
                                  CGRectGetMidY(rect) - buttonSize.height * 0.5f);
    
    self.signInButton.frame = CGRectMake(CGRectGetMidX(rect) - buttonSize.width * 0.5f,
                                         CGRectGetMidY(rect) - buttonSize.height * 0.5f,
                                         buttonSize.width,
                                         buttonSize.height);
    
}
@end
