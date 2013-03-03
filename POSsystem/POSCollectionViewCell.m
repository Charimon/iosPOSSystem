//
//  POSCollectionViewCell.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSCollectionViewCell.h"
#import "POSConstants.h"

@implementation POSCollectionViewCell

#pragma mark - getters/setters
- (UILabel *) nameLabel {
    if(_nameLabel) return _nameLabel;
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.font = [UIFont fontWithName:@"Lato-Bold" size:18.f];
    _nameLabel.textAlignment = NSTextAlignmentRight;
    
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _nameLabel;
}

- (UIView *) nameLabelBackground {
    if(_nameLabelBackground) return _nameLabelBackground;
    _nameLabelBackground = [[UIView alloc] initWithFrame:CGRectZero];
    _nameLabelBackground.backgroundColor = IMAGE_LABEL_COLOR;
    
    _nameLabelBackground.translatesAutoresizingMaskIntoConstraints = NO;
    return _nameLabelBackground;
}

- (UIImageView *) imageView {
    if(_imageView) return _imageView;
    
    //strictly for selecting a random photo, should be elminated once photos come from the system
    if(arc4random()%2) _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sofa1.png"]];
    else _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sofa2.png"]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    return _imageView;
}

#pragma mark - view methods
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.nameLabelBackground];
        [self.contentView addSubview:self.nameLabel];
        ADD_CONSTRAINT(self.contentView, self.imageView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeLeading, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.imageView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTop, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.imageView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTrailing, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.imageView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeBottom, 1.f, 0);
        
        ADD_CONSTRAINT(self.contentView, self.nameLabelBackground, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeLeading, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.nameLabelBackground, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeTrailing, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.nameLabelBackground, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeBottom, 1.f, 0);
        
        ADD_CONSTRAINT(self.contentView, self.nameLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.nameLabelBackground, NSLayoutAttributeLeading, 1.f, 8.f);
        ADD_CONSTRAINT(self.contentView, self.nameLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.nameLabelBackground, NSLayoutAttributeTrailing, 1.f, -8.f);
        ADD_CONSTRAINT(self.contentView, self.nameLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.nameLabelBackground, NSLayoutAttributeBottom, 1.f, -4.f);
        ADD_CONSTRAINT(self.contentView, self.nameLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.nameLabelBackground, NSLayoutAttributeTop, 1.f, 4.f);
        
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void) setupWithProduct: (POSProductGroup *) productGroup {
    self.nameLabel.text = productGroup.title;
}

@end
