//
//  POSTableViewCell.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/28/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSTableViewCell.h"
#import "POSConstants.h"

@implementation POSTableViewCell

@synthesize thumbnailImageView = _thumbnailImageView;
-(UIImageView *) thumbnailImageView {
    if(_thumbnailImageView) return _thumbnailImageView;
    //strictly for selecting a random photo, should be elminated once photos come from the system
    if(arc4random()%2) _thumbnailImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sofa1.png"]];
    else _thumbnailImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sofa2.png"]];
    _thumbnailImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _thumbnailImageView.translatesAutoresizingMaskIntoConstraints = NO;
    return _thumbnailImageView;
}

@synthesize titleLabel = _titleLabel;
-(UILabel *) titleLabel {
    if(_titleLabel) return _titleLabel;
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor = [UIColor clearColor];
    
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:16.f];
    _titleLabel.textAlignment = NSTextAlignmentLeft;

    
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _titleLabel;
}

@synthesize descriptionLabel = _descriptionLabel;
-(UILabel *) descriptionLabel {
    if(_descriptionLabel) return _descriptionLabel;
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _descriptionLabel.backgroundColor = [UIColor clearColor];
    
    _descriptionLabel.textColor = [UIColor blackColor];
    _descriptionLabel.font = [UIFont fontWithName:@"Lato-Bold" size:16.f];
    _descriptionLabel.textAlignment = NSTextAlignmentLeft;
    _descriptionLabel.numberOfLines = 2;
    [_descriptionLabel setContentHuggingPriority:UILayoutPriorityDefaultLow-2 forAxis:UILayoutConstraintAxisVertical];
    
    _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _descriptionLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.thumbnailImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.descriptionLabel];
        ADD_CONSTRAINT(self.contentView, self.thumbnailImageView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeLeading, 1.f, 1.f);
        ADD_CONSTRAINT(self.contentView, self.thumbnailImageView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTop, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.thumbnailImageView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeBottom, 1.f, -1.f);
        ADD_CONSTRAINT(self.contentView, self.thumbnailImageView, NSLayoutAttributeWidth, NSLayoutRelationEqual, self.thumbnailImageView, NSLayoutAttributeHeight, 1.f, 0);
        
        ADD_CONSTRAINT(self.contentView, self.titleLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.thumbnailImageView, NSLayoutAttributeTrailing, 1.f, 8.f);
        ADD_CONSTRAINT(self.contentView, self.titleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTop, 1.f, 4.f);
        ADD_CONSTRAINT(self.contentView, self.titleLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTrailing, 1.f, 0);
        
        ADD_CONSTRAINT(self.contentView, self.descriptionLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.thumbnailImageView, NSLayoutAttributeTrailing, 1.f, 8.f);
        ADD_CONSTRAINT(self.contentView, self.descriptionLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.titleLabel, NSLayoutAttributeBottom, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.descriptionLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTrailing, 1.f, 0);
        ADD_CONSTRAINT(self.contentView, self.descriptionLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeBottom, 1.f, 0);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
