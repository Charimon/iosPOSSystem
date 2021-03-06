//
//  POSCartViewController.h
//  POSsystem
//
//  Created by Andrew Charkin on 3/1/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSCoordinatorDelegate.h"

@interface POSCartViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *footer;

@property (strong, nonatomic) UILabel *priceLabelTitle;
@property (strong, nonatomic) UILabel *priceLabel;

//type: NSMutableArray[NSMutableArray[NSString *]]
@property (strong, nonatomic) NSMutableArray *data;

@property (weak, nonatomic) id<POSCoordinatorDelegate> coordinatorDelegate;

@end
