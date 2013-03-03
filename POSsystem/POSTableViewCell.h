//
//  POSTableViewCell.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/28/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSProduct.h"

@interface POSTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *thumbnailImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

-(void) setupWithProduct: (POSProduct *) product;

@end
