//
//  CRRBaseView.h
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRRBaseView : UIView

- (UIActivityIndicatorView *)addLoadingView;
- (UIActivityIndicatorView *)activityIndicator;
- (void)removeLoadingView;

- (UIButton *)addReloadButtonWithTarget:(id)target action:(SEL)action;
- (UIButton *)addReloadButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (UIButton *)addReloadButtonWithError:(NSError *)error target:(id)target action:(SEL)action;
- (void)removeReloadButton;

- (void)addInfoLabelWithText:(NSString *)text;
- (void)removeInfoLabel;
- (UILabel *)infoLabel;

@end
