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
    return @"05.12.2014";
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark UITableViewDataSource
- (CRREventCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CRREventCell *cell = [tableView dequeueReusableCellWithIdentifier:CRREventCellIdentifier];
    if (!cell) {
        cell = [[CRREventCell alloc] initWithReuseIdentifier:CRREventCellIdentifier];
    }
    
    CRREvent *event = self.model[indexPath.row];
    
    cell.textLabel.text = event.startDate;
    cell.detailTextLabel.text = event.endDate;
    cell.nameLabel.text = event.summary ? : @"No data";
    
    return cell;
}

#pragma mark Private Methods
- (void)loadData {
    
    [_aView addLoadingView];
    _aView.tableView.hidden = YES;
    [CRRAPIManager calendarEventsWithCalendar:self.calendar success:^(NSArray *array, NSString *name) {
        
        self.title = name;
        _model = array;
        [_aView removeLoadingView];
        _aView.tableView.hidden = NO;
        [_aView.tableView reloadData];
        
    } failure:^(NSError *error) {
        [_aView addReloadButtonWithError:error target:self action:@selector(loadData)];
    }];
    
}


@end
