//
//  POSProductViewController.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSProductViewController.h"
#import "POSTableViewCell.h"
#import "POSConstants.h"
#import "POSProduct.h"

@interface POSProductViewController ()
@property (strong, nonatomic) UIView *border;
@end

@implementation POSProductViewController

#pragma mark - getters/setters
@synthesize coordinatorDelegate = _coordinatorDelegate;

-(NSMutableArray *) data {
    _data = [[NSMutableArray alloc] init];
    [_data addObject:[[NSMutableArray alloc] initWithObjects:@"Sofa 1", @"Sofa 2", @"Sofa 3", @"Sofa 4", @"Sofa 5", @"Sofa 6", nil]];
    return _data;
}

- (UITableView *) tableView {
    if(_tableView) return _tableView;
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[POSTableViewCell class] forCellReuseIdentifier:TABLE_VIEW_CELL_INDENTIFIER];
    
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    return _tableView;
}

-(UIView *) border {
    if(_border) return _border;
    _border = [[UIView alloc] initWithFrame:CGRectZero];
    _border.backgroundColor = HEADING_BACKGROUND_BORDER_COLOR;
    
    _border.translatesAutoresizingMaskIntoConstraints = NO;
    return _border;
}

#pragma mark - view methods
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.border];
    
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, -1.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f);
    
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeWidth, NSLayoutRelationEqual, self.view, NSLayoutAttributeWidth, 0.f, 1.f);
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.data objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    POSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_CELL_INDENTIFIER forIndexPath:indexPath];
    if(cell == nil) cell = [[POSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_CELL_INDENTIFIER];
    
    POSProduct *p = [[POSProduct alloc] init];
    p.title = [[self.data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    p.description = @"test";
    [cell setupWithProduct:p];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

@end
