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
@property (strong, nonatomic) UIView *border;
@property (strong, nonatomic) UIView *footerBorder;
@end

@implementation POSCartViewController

#pragma mark - setters/getters
-(UIView *) border {
    if(_border) return _border;
    _border = [[UIView alloc] initWithFrame:CGRectZero];
    _border.backgroundColor = HEADING_BACKGROUND_BORDER_COLOR;
    
    _border.translatesAutoresizingMaskIntoConstraints = NO;
    return _border;
}

-(UIView *) footerBorder {
    if(_footerBorder) return _footerBorder;
    _footerBorder = [[UIView alloc] initWithFrame:CGRectZero];
    _footerBorder.backgroundColor = HEADING_BACKGROUND_BORDER_COLOR;
    
    _footerBorder.translatesAutoresizingMaskIntoConstraints = NO;
    return _footerBorder;
}

-(UIView *) footer {
    if(_footer) return _footer;
    _footer = [[UIView alloc] initWithFrame:CGRectZero];
    _footer.backgroundColor = HEADING_BACKGROUND_COLOR;
    
    _footer.translatesAutoresizingMaskIntoConstraints = NO;
    return _footer;
}

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

#pragma mark - view methods
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.border];
    [self.view addSubview: self.footer];
    [self.view addSubview: self.footerBorder];
    
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 1.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.tableView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.footerBorder, NSLayoutAttributeTop, 1.f, 0.f);
    
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeWidth, NSLayoutRelationEqual, self.view, NSLayoutAttributeWidth, 0.f, 1.f);
    ADD_CONSTRAINT(self.view, self.border, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f);

    ADD_CONSTRAINT(self.view, self.footer, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 1.f);
    ADD_CONSTRAINT(self.view, self.footer, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.footer, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.footer, NSLayoutAttributeHeight, 0.f, NAVIGATION_BAR_HEIGHT);
    ADD_CONSTRAINT(self.view, self.footer, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f);
    
    ADD_CONSTRAINT(self.view, self.footerBorder, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 1.f);
    ADD_CONSTRAINT(self.view, self.footerBorder, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.footerBorder, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.footer, NSLayoutAttributeHeight, 0.f, 1.f);
    ADD_CONSTRAINT(self.view, self.footerBorder, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.footer, NSLayoutAttributeTop, 1.f, 0.f);
    
    self.view.backgroundColor = [UIColor whiteColor];
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