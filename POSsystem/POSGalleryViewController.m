//
//  POSGalleryViewController.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/28/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSGalleryViewController.h"
#import "POSConstants.h"

@interface POSGalleryViewController ()

@end

@implementation POSGalleryViewController

#pragma mark - setters/getters
-(UIImageView *) imageView {
    if(_imageView) return _imageView;
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sofa1"]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    return _imageView;
}

-(UIButton *) closeButton {
    if(_closeButton) return _closeButton;
    _closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_closeButton setTitle:@"close" forState:UIControlStateNormal];
    [_closeButton addTarget:self.coordinatorDelegate action:@selector(detailImageCloseClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    return _closeButton;
}

#pragma mark - view methods
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.closeButton];
    
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.imageView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);

    ADD_CONSTRAINT(self.view, self.closeButton, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.closeButton, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    
    self.view.backgroundColor = [UIColor blackColor];
}

@end
