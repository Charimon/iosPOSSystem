//
//  POSViewController.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSCoordinatorDelegate.h"
#import "POSNavigationBar.h"

@interface POSViewController : UIViewController <POSCoordinatorDelegate, POSNavigationBarDelegate>
-(void) nilifyViewController: (UIViewController *) viewController;
@end
