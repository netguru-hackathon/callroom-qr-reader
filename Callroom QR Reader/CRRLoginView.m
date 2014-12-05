//
//  LoginView.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRLoginView.h"

@implementation CRRLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _signInButton = [[GPPSignInButton alloc] init];
        [self addSubview:_signInButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGSize buttonSize = CGSizeMake(200.0f, 40.0f);
    self.signInButton.frame = CGRectMake(CGRectGetMidX(rect) - buttonSize.width * 0.5f,
                                         CGRectGetMidY(rect) - buttonSize.height * 0.5f,
                                         buttonSize.width,
                                         buttonSize.height);
    
}
@end
