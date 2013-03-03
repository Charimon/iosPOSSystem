//
//  POSProductDetailViewController.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSCoordinatorDelegate.h"
#import "POSFragmentDelegate.h"

@interface POSProductDetailViewController : UIViewController<POSFragmentDelegate>

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@end
