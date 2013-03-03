//
//  POSCartViewController.m
//  POSsystem
//
//  Created by Andrew Charkin on 3/1/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSCartViewController.h"
#import "POSTableViewCell.h"
#import "POSConstants.h"
#import <QuartzCore/QuartzCore.h>

@interface POSCartViewController ()

@end

@implementation POSCartViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.view addSubview:self.tableView];
    
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f);
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.borderColor = HEADING_BACKGROUND_BORDER_COLOR.CGColor;
    self.view.layer.borderWidth = 1.f;
    self.view.layer.cornerRadius = 10.f;
    self.view.layer.shadowColor = HEADING_BACKGROUND_COLOR.CGColor;
    self.view.layer.shadowOpacity = 0.9f;
    self.view.layer.shadowRadius = 5.f;
    self.view.layer.shadowOffset = CGSizeMake(0, 0);
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
    
    cell.titleLabel.text = [[self.data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = @"test";
    
    return cell;
}


@end