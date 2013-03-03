//
//  POSProductDetailViewController.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSProductDetailViewController.h"
#import "POSConstants.h"

@interface POSProductDetailViewController ()
@property (strong, nonatomic) UIButton *imageViewButton;

@end

@implementation POSProductDetailViewController

#pragma mark - setters/getters
@synthesize coordinatorDelegate = _coordinatorDelegate;

-(UIImageView *) imageView {
    if(_imageView) return _imageView;
    
    if(arc4random()%2) _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sofa1.png"]];
    else _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sofa2.png"]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    return _imageView;
}

-(UIButton *) imageViewButton {
    if(_imageViewButton) return _imageViewButton;
    _imageViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _imageViewButton.backgroundColor = [UIColor clearColor];
    [_imageViewButton addTarget:self.coordinatorDelegate action:@selector(detailImageClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _imageViewButton.translatesAutoresizingMaskIntoConstraints = NO;
    return _imageViewButton;
}

-(UILabel *) titleLabel {
    if(_titleLabel) return _titleLabel;
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor = [UIColor clearColor];
    
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:22.f];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.text = @"TEST";
    
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _titleLabel;
}

-(UILabel *) descriptionLabel {
    if(_descriptionLabel) return _descriptionLabel;
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    _descriptionLabel.textColor = [UIColor blackColor];
    _descriptionLabel.font = [UIFont fontWithName:@"Lato-Bold" size:18.f];
    _descriptionLabel.textAlignment = NSTextAlignmentLeft;
    
    _descriptionLabel.text = @"DESCRIPTION goes here";
    _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _descriptionLabel;
}


#pragma mark - view methods
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.imageViewButton];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.descriptionLabel];
    
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 20.f);
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 20.f);
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeWidth, NSLayoutRelationLessThanOrEqual, self.view, NSLayoutAttributeWidth, 0.f, 200.f);
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeWidth, 1.f, 0.f);
    
    ADD_CONSTRAINT(self.view, self.imageViewButton, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeLeading, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.imageViewButton, NSLayoutAttributeTop, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.imageViewButton, NSLayoutAttributeWidth, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeWidth, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.imageViewButton, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeWidth, 1.f, 0.f);

    ADD_CONSTRAINT(self.view, self.titleLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeTrailing, 1.f, 10.f);
    ADD_CONSTRAINT(self.view, self.titleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.imageView, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.titleLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, -20.f);
    
    ADD_CONSTRAINT(self.view, self.descriptionLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.titleLabel, NSLayoutAttributeLeading, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.descriptionLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.titleLabel, NSLayoutAttributeBottom, 1.f, 10.f);
    ADD_CONSTRAINT(self.view, self.descriptionLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.titleLabel, NSLayoutAttributeTrailing, 1.f, 0.f);
}

@end
