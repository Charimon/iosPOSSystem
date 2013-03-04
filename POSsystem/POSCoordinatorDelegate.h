//
//  POSCoordinatorDelegate.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol POSCoordinatorDelegate <NSObject>

-(void) categoryClicked:(NSString *) title;
-(void) subCategoryClicked:(NSString *) title;
-(void) detailImageClicked: (UIButton *) button;
-(void) detailImageCloseClicked: (UIButton *) button;

-(void) nilifyViewController: (UIViewController *) viewController;

@end
