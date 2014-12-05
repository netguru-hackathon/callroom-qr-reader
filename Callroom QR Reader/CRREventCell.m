//
//  CRREventCell.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRREventCell.h"

@interface CRREventCell ()

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation CRREventCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        UIFont *font = [UIFont boldSystemFontOfSize:14.0f];
        
        self.textLabel.font = font;
        self.detailTextLabel.font = font;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.detailTextLabel.textAlignment = NSTextAlignmentCenter;
        
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = [UIColor blackColor];
        [self addSubview:_separatorView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.numberOfLines = 0;
        [self addSubview:_nameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGFloat width = 70.0f;
    CGFloat separatorWidth = 1.0f;
    
    self.textLabel.frame = CGRectMake(0.0f,
                                      0.0f,
                                      width,
                                      CGRectGetMidY(rect));
    
    self.detailTextLabel.frame = CGRectMake(0.0f,
                                            CGRectGetMidY(rect),
                                            width,
                                            CGRectGetMidY(rect));
    
    self.separatorView.frame = CGRectMake(CGRectGetMaxX(self.textLabel.frame),
                                          0.0f,
                                          separatorWidth,
                                          CGRectGetHeight(rect));
    
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.separatorView.frame) + 5.0f,
                                      0.0f,
                                      CGRectGetWidth(rect) - CGRectGetMaxX(self.separatorView.frame) - 5.0f,
                                      CGRectGetHeight(rect));
}


@end
