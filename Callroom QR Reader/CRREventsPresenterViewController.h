//
//  CRRCalendarPresenterViewController.h
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRRCalendar;

@interface CRREventsPresenterViewController : UIViewController

- (instancetype)initWithCalendar:(CRRCalendar *)calendar;

@end
