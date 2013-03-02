//
//  POSProductViewController.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSCoordinatorDelegate.h"

@interface POSProductViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

//type: NSMutableArray[NSMutableArray[NSString *]]
@property (strong, nonatomic) NSMutableArray *data;

@property (weak, nonatomic) id<POSCoordinatorDelegate> coordinatorDelegate;

@end