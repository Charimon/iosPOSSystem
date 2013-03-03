//
//  POSCollectionViewCell.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSProductGroup.h"

@interface POSCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIView *nameLabelBackground;
@property (strong, nonatomic) UIImageView *imageView;

-(void) setupWithProduct: (POSProductGroup *) productGroup;

@end
