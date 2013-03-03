//
//  POSGalleryViewController.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/28/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSCoordinatorDelegate.h"
#import "POSFragmentDelegate.h"

@interface POSGalleryViewController : UIViewController<POSFragmentDelegate>


@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *closeButton;

@end
