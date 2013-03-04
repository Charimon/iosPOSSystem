//
//  POSGalleryViewController.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/28/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSGalleryViewController.h"
#import "POSConstants.h"
#import "POSProduct.h"

@interface POSGalleryViewController ()
@property (nonatomic, strong) UIPanGestureRecognizer* panGestureRecognizer;
-(void) handlePanFrom: (UIPanGestureRecognizer *)recognizer;
@end

@implementation POSGalleryViewController

#pragma mark - setters/getters
@synthesize coordinatorDelegate = _coordinatorDelegate;

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
- (void)viewWillAppear:(BOOL)animated{
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

- (void) viewDidAppear:(BOOL)animated {
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    [self.view addGestureRecognizer:self.panGestureRecognizer];
}

#pragma mark - member methods
-(void) handlePanFrom: (UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:recognizer.view];
    CGPoint velocity = [recognizer velocityInView:recognizer.view];
    CGFloat height = self.view.frame.size.width;
    
    //sliding from right to left is ignored
    if(translation.y == 0) return;
    if (recognizer.state == UIGestureRecognizerStateChanged && self.view){
        for (NSLayoutConstraint *c in self.view.superview.constraints) {
            if(c.firstItem == self.view){
                [self.view.superview removeConstraint:c];
            }
        }
        ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeLeading, 1.f, 0.f);
        ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeTrailing, 1.f, 0.f);
        ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeHeight, 1.f, 0.f);
        ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeTop, 1.f, translation.y);
        CGFloat opacity = 1- ABS(translation.y)/height;
        self.view.alpha = opacity;
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded){
        if(ABS(translation.y) > height/4 || velocity.y > 1000.0f){
            [UIView animateWithDuration:.4
                                  delay:0
                                options: UIViewAnimationOptionTransitionNone | UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 for (NSLayoutConstraint *c in self.view.superview.constraints) {
                                     if(c.firstItem == self.view) [self.view.superview removeConstraint:c];
                                 }
                                 
                                 ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeLeading, 1.f, 0.f);
                                 ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeTrailing, 1.f, 0.f);
                                 ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeHeight, 1.f, 0.f);
                                 
                                 if(translation.y > 0) {
                                     ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeBottom, 1.f, 0.f);
                                 } else {
                                     ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeTop, 1.f, 0.f);
                                 }
                                 
                                 self.view.alpha = 0.f;
                                 [self.view layoutIfNeeded];
                                 
                             } completion:^(BOOL finished) {
                                 [self.coordinatorDelegate nilifyViewController:self];
                             }];
            [self.view layoutIfNeeded];
        } else {
            //slide failed, return to original
            [UIView animateWithDuration:.4
                                  delay:0
                                options: UIViewAnimationOptionTransitionNone | UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 for (NSLayoutConstraint *c in self.view.superview.constraints) {
                                     if(c.firstItem == self.view) [self.view.superview removeConstraint:c];
                                 }
                                 
                                 ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeLeading, 1.f, 0.f);
                                 ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeTrailing, 1.f, 0.f);
                                 ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeTop, 1.f, 0.f);
                                 ADD_CONSTRAINT(self.view.superview, self.view, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view.superview, NSLayoutAttributeBottom, 1.f, 0.f);
                                 self.view.alpha = 1.f;
                                 [self.view layoutIfNeeded];
                                 
                             } completion:^(BOOL finished) {
            }];
        }

    }
}

@end
