//
//  CRRCalendarPresenterViewController.m
//  Callroom QR Reader
//
//  Created by Patryk Kaczmarek on 05.12.2014.
//  Copyright (c) 2014 Netguru. All rights reserved.
//

#import "CRREventsPresenterViewController.h"
#import "CRREventsPresenterView.h"
#import "CRREventCell.h"
#import "CRRAPIManager.h"
#import "CRRCalendar.h"
#import "CRREvent.h"

@interface CRREventsPresenterViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) CRREventsPresenterView *aView;
@property (nonatomic, strong) CRRCalendar *calendar;
@property (nonatomic, strong) NSArray *model;

@end

@implementation CRREventsPresenterViewController

- (instancetype)initWithCalendar:(CRRCalendar *)calendar {
    self = [super init];
    if (self) {
        _calendar = calendar;
    }
    return self;
}

- (void)loadView {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CRREventsPresenterView *view = [[CRREventsPresenterView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    _aView = view;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _aView.tableView.delegate = self;
    _aView.tableView.dataSource = self;
    
    [self loadData];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Available calendars";
}

#pragma mark UITableViewDataSource
- (CRREventCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CRREventCell *cell = [tableView dequeueReusableCellWithIdentifier:CRREventCellIdentifier];
    if (!cell) {
        cell = [[CRREventCell alloc] initWithReuseIdentifier:CRREventCellIdentifier];
    }
    
    CRREvent *event = self.model[indexPath.row];
    cell.textLabel.text = event.info;
    
    return cell;
}

#pragma mark Private Methods
- (void)loadData {
    
    [_aView addLoadingView];
    _aView.tableView.hidden = YES;
    [CRRAPIManager calendarEventsWithCalendar:self.calendar success:^(NSArray *array) {
        
        _model = array;
        [_aView removeLoadingView];
        _aView.tableView.hidden = NO;
        [_aView.tableView reloadData];
        
    } failure:^(NSError *error) {
        [_aView addReloadButtonWithTarget:self action:@selector(loadData)];
    }];
    
}


@end
