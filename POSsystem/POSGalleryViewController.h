//
//  POSGalleryViewController.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/28/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSCoordinatorDelegate.h"

@interface POSGalleryViewController : UIViewController


@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *closeButton;

@property (weak, nonatomic) id<POSCoordinatorDelegate> coordinatorDelegate;

@end
