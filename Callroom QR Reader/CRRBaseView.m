//
//  CRRBaseView.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRRBaseView.h"
#import "Defines.h"

@interface CRRBaseView ()

@property (nonatomic, strong) UIActivityIndicatorView *loadingDataActivityIndicator;
@property (nonatomic, strong) UIButton *reloadButton;
@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation CRRBaseView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    
    [self setReloadButtonFrame];
    [self setActivityIndicatorFrame];
    _infoLabel.frame = rect;
}

#pragma mark - Reload Button

- (UIButton *)addReloadButtonWithTarget:(id)target action:(SEL)action {
    return [self addReloadButtonWithTitle:nil target:target action:action];
}

- (UIButton *)addReloadButtonWithError:(NSError *)error target:(id)target action:(SEL)action {
    NSString *title = [NSString stringWithFormat:@"%@\nTap to try again", error.localizedDescription];
    return [self addReloadButtonWithTitle:title target:target action:action];
}

- (UIButton *)addReloadButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    [self removeLoadingView];
    [self removeInfoLabel];
    
    if (!_reloadButton) {
        
        if (!title) {
            title = NSLocalizedString(@"An error did appear.\nTap to try again", @"reload Data");
        }
        
        _reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reloadButton setTitleColor:kAPPColor forState:UIControlStateNormal];
        [_reloadButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _reloadButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
        
        [_reloadButton setTitle:title forState:UIControlStateNormal];
        _reloadButton.titleLabel.numberOfLines = 0;
        _reloadButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_reloadButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self setReloadButtonFrame];
        [self addSubview:_reloadButton];
    }
    return _reloadButton;
}

- (void)removeReloadButton {
    
    if (_reloadButton && _reloadButton.superview) {
        [_reloadButton removeFromSuperview];
        _reloadButton = nil;
    }
}

- (void)setReloadButtonFrame {
    CGRect rect = self.bounds;
    
    CGSize buttonSize = CGSizeMake(CGRectGetWidth(rect), 200.0f);
    _reloadButton.frame = CGRectMake(0.0f,
                                     CGRectGetMidY(rect) - buttonSize.height * 0.5f,
                                     buttonSize.width,
                                     buttonSize.height);
}

#pragma mark - Activity Indicator View

- (UIActivityIndicatorView *)addLoadingView {
    
    [self removeInfoLabel];
    [self removeReloadButton];
    
    if (!_loadingDataActivityIndicator) {
        
        _loadingDataActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _loadingDataActivityIndicator.color = [UIColor blackColor];
        [_loadingDataActivityIndicator startAnimating];
        [self setActivityIndicatorFrame];
        [self addSubview:_loadingDataActivityIndicator];
    }
    return _loadingDataActivityIndicator;
}

- (void)removeLoadingView {
    
    if (_loadingDataActivityIndicator && _loadingDataActivityIndicator.superview) {
        [_loadingDataActivityIndicator removeFromSuperview];
        _loadingDataActivityIndicator = nil;
    }
}

- (UIActivityIndicatorView *)activityIndicator {
    return _loadingDataActivityIndicator;
}

- (void)setActivityIndicatorFrame {
    CGFloat activityDimension = 50.0f;
    CGRect rect = self.bounds;
    
    _loadingDataActivityIndicator.frame = CGRectMake(CGRectGetMidX(rect) - activityDimension * 0.5f,
                                                     CGRectGetMidY(rect) - activityDimension * 0.5f,
                                                     activityDimension,
                                                     activityDimension);
}

#pragma mark - Result Label

- (void)addInfoLabelWithText:(NSString *)text {
    
    [self removeLoadingView];
    [self removeReloadButton];
    
    if (!_infoLabel) {
        
        if (!text) {
            text = NSLocalizedString(@"Brak danych do wyświetlenia", @"no data to display - display after fetching request in no data case");
        }
        
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.frame = self.bounds;
        _infoLabel.textColor = [UIColor darkGrayColor];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
        _infoLabel.font = [UIFont systemFontOfSize:14.0f];
        _infoLabel.numberOfLines = 0;
        _infoLabel.text = text;
        [self addSubview:_infoLabel];
    }
}

- (void)removeInfoLabel {
    
    if (_infoLabel && _infoLabel.superview) {
        [_infoLabel removeFromSuperview];
        _infoLabel = nil;
    }
}

- (UILabel *)infoLabel {
    return _infoLabel;
}

@end
