//
//  CRRCalendarSelectorView.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRCalendarSelectorView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CRRCalendarSelectorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:(245.0f/255.0f) alpha:1.0f];
        
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = self.backgroundColor;
        [self addSubview:_tableView];
        
        _QRButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QRButton setTitle:@"Scan QR code" forState:UIControlStateNormal];
        _QRButton.backgroundColor = [UIColor blueColor];
        _QRButton.layer.cornerRadius = 10.f;
        [self addSubview:_QRButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    self.QRButton.frame = CGRectInset(CGRectMake(0.0f, 0.0f, CGRectGetWidth(rect), CGRectGetMidY(rect)), 40.0f, 40.0f);
    self.tableView.frame = CGRectMake(0.0f,
                                      CGRectGetMidY(rect),
                                      CGRectGetWidth(rect),
                                      CGRectGetHeight(rect) - CGRectGetMidY(rect));
    
    
}

@end
