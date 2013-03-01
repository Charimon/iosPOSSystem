//
//  POSNavigationBar.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSNavigationBar.h"
#import "POSConstants.h"

@interface POSNavigationBar ()
@property (strong, nonatomic) NSMutableArray * buttonStack;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *animatingTitleLabel;
@property (strong, nonatomic) UIView *border;
@end

@implementation POSNavigationBar

#pragma mark - setters/getters
-(NSMutableArray *) buttonStack {
    if(_buttonStack) return _buttonStack;
    _buttonStack = [[NSMutableArray alloc] init];
    return _buttonStack;
}

-(UILabel *) titleLabel {
    if(_titleLabel) return _titleLabel;
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:22.f];
    
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _titleLabel;
}

-(UIView *) border {
    if(_border) return _border;
    _border = [[UIView alloc] initWithFrame:CGRectZero];
    _border.backgroundColor = HEADING_BACKGROUND_BORDER_COLOR;
    
    _border.translatesAutoresizingMaskIntoConstraints = NO;
    return _border;
}
-(UIButton *) cartButton {
    if(_cartButton) return _cartButton;
    _cartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cartButton setBackgroundImage:[[UIImage imageNamed:@"navBarButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 1.f, 0.f, 1.f)] forState:UIControlStateNormal];
    [_cartButton setBackgroundImage:[[UIImage imageNamed:@"navBarButtonSelected"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 1.f, 0.f, 1.f)] forState:UIControlStateSelected];
    [_cartButton setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
    [_cartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cartButton addTarget:self.delegate action:@selector(cartButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    _cartButton.contentEdgeInsets = UIEdgeInsetsMake(8.f, 8.f, 8.f, 8.f);
    
    _cartButton.translatesAutoresizingMaskIntoConstraints = NO;
    return _cartButton;
}

-(UIButton *) userButton {
    if(_userButton) return _userButton;
    _userButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_userButton setBackgroundImage:[[UIImage imageNamed:@"navBarButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 1.f, 0.f, 1.f)] forState:UIControlStateNormal];
    [_userButton setBackgroundImage:[[UIImage imageNamed:@"navBarButtonSelected"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 1.f, 0.f, 1.f)] forState:UIControlStateSelected];
    [_userButton setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
    [_userButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_userButton addTarget:self.delegate action:@selector(userButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    _userButton.contentEdgeInsets = UIEdgeInsetsMake(8.f, 8.f, 8.f, 8.f);
    
    _userButton.translatesAutoresizingMaskIntoConstraints = NO;
    return _userButton;
}

-(UIButton *) scannerButton {
    if(_scannerButton) return _scannerButton;
    _scannerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_scannerButton setBackgroundImage:[[UIImage imageNamed:@"navBarButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 1.f, 0.f, 1.f)] forState:UIControlStateNormal];
    [_scannerButton setBackgroundImage:[[UIImage imageNamed:@"navBarButtonSelected"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 1.f, 0.f, 1.f)] forState:UIControlStateSelected];
    [_scannerButton setImage:[UIImage imageNamed:@"scanner"] forState:UIControlStateNormal];
    [_scannerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_scannerButton addTarget:self.delegate action:@selector(scannerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    _scannerButton.contentEdgeInsets = UIEdgeInsetsMake(8.f, 8.f, 8.f, 8.f);
    
    _scannerButton.translatesAutoresizingMaskIntoConstraints = NO;
    return _scannerButton;
}

#pragma mark - view methods
- (id)initWithDefaultTitle: (NSString *) title
{
    self = [super init];
    if (self) {
        [self addSubview: self.border];
        [self addSubview: self.titleLabel];
        [self addSubview: self.cartButton];
        [self addSubview: self.userButton];
        [self addSubview: self.scannerButton];
        
        self.titleLabel.text = title;
        ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self, NSLayoutAttributeCenterX, 1.f, 0);
        ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0);
        ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
        
        
        ADD_CONSTRAINT(self, self.border, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0);
        ADD_CONSTRAINT(self, self.border, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0);
        ADD_CONSTRAINT(self, self.border, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
        ADD_CONSTRAINT(self, self.border, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.border, NSLayoutAttributeHeight, 0.f, 1.f);
        
        ADD_CONSTRAINT(self, self.cartButton, NSLayoutAttributeWidth, NSLayoutRelationEqual, self, NSLayoutAttributeHeight, 1.f, 0);
        ADD_CONSTRAINT(self, self.cartButton, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0);
        ADD_CONSTRAINT(self, self.cartButton, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
        ADD_CONSTRAINT(self, self.cartButton, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0.f);
        
        ADD_CONSTRAINT(self, self.userButton, NSLayoutAttributeWidth, NSLayoutRelationEqual, self, NSLayoutAttributeHeight, 1.f, 0);
        ADD_CONSTRAINT(self, self.userButton, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.cartButton, NSLayoutAttributeLeading, 1.f, 0);
        ADD_CONSTRAINT(self, self.userButton, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
        ADD_CONSTRAINT(self, self.userButton, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0.f);
        
        ADD_CONSTRAINT(self, self.scannerButton, NSLayoutAttributeWidth, NSLayoutRelationEqual, self, NSLayoutAttributeHeight, 1.f, 0);
        ADD_CONSTRAINT(self, self.scannerButton, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.userButton, NSLayoutAttributeLeading, 1.f, 0);
        ADD_CONSTRAINT(self, self.scannerButton, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
        ADD_CONSTRAINT(self, self.scannerButton, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0.f);
        
        
        self.backgroundColor = HEADING_BACKGROUND_COLOR;
    }
    return self;
}

-(void) pushControllerDuringAnimation {
    //move center label to left
    for(NSLayoutConstraint *constraint in self.constraints){
        if(constraint.firstItem == self.titleLabel){
            [self removeConstraint:constraint];
        }
    }
    
    //-1.f because for some reasons button and UILabel don't vertically align the same, without it, you get a jerk up when the label becomes a button
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, -1.f);
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
    if(self.buttonStack.count == 0){
        ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 8.f);
    } else {
        ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.buttonStack.lastObject, NSLayoutAttributeTrailing, 1.f, 8.f);
    }
    
    self.titleLabel.textColor = HEADING_BACKGROUND_BORDER_COLOR;
}
-(void) pushControllerPostAnimation:(NSString *)name {
    //convert left label to button, create new center label
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:self.titleLabel.text forState:UIControlStateNormal];
    [button setTitleColor:HEADING_BACKGROUND_BORDER_COLOR forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:22.f];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setBackgroundImage:[[UIImage imageNamed:@"button"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 0.f, 50.f, 20.f)] forState:UIControlStateNormal];
    button.contentEdgeInsets= UIEdgeInsetsMake(0, 8.f, 0, 12.f);
    [button addTarget:self.delegate action:@selector(navigationBarPopViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    ADD_CONSTRAINT(self, button, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0);
    ADD_CONSTRAINT(self, button, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
    if(self.buttonStack.count == 0){
        ADD_CONSTRAINT(self, button, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0);
    } else {
        ADD_CONSTRAINT(self, button, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.buttonStack.lastObject, NSLayoutAttributeTrailing, 1.f, 0);
    }
    
    for(NSLayoutConstraint *constraint in self.constraints){
        if(constraint.firstItem == self.titleLabel){
            [self removeConstraint:constraint];
        }
    }
    
    self.titleLabel.text = name;
    self.titleLabel.textColor = [UIColor blackColor];
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self, NSLayoutAttributeCenterX, 1.f, 0);
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0);
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
    
    
    [self.buttonStack addObject:button];
}

-(NSInteger) popControllerPreAnimation: (UIButton *) button {
    
    NSUInteger buttonIndex;
    if(button) {
        buttonIndex = [self.buttonStack indexOfObject:button];
    } else {
        buttonIndex = self.buttonStack.count - 1;
        button = [self.buttonStack lastObject];
    }
    
    self.animatingTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.animatingTitleLabel.backgroundColor = [UIColor clearColor];
    self.animatingTitleLabel.font = [UIFont fontWithName:@"Lato-Bold" size:22.f];
    self.animatingTitleLabel.text = button.titleLabel.text;
    self.animatingTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.animatingTitleLabel];
    
    NSMutableArray *newButtonStack = [[NSMutableArray alloc] init];
    for(NSUInteger i=0; i< self.buttonStack.count; i++) {
        UIButton *curButton = [self.buttonStack objectAtIndex:i];
        if(i < buttonIndex) {
            [newButtonStack addObject:curButton];
        } else {
            [curButton removeFromSuperview];
        }
    }
    self.buttonStack = newButtonStack;
    
    //-1.f because for some reasons button and UILabel don't vertically align the same, without it, you get a jerk up when the label becomes a button
    ADD_CONSTRAINT(self, self.animatingTitleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, -1.f);
    ADD_CONSTRAINT(self, self.animatingTitleLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
    if(self.buttonStack.count == 0){
        ADD_CONSTRAINT(self, self.animatingTitleLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 8.f);
    } else {
        ADD_CONSTRAINT(self, self.animatingTitleLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.buttonStack.lastObject, NSLayoutAttributeTrailing, 1.f, 8.f);
    }
    
    return buttonIndex;
}
-(void) popControllerDuringAnimation {
    for(NSLayoutConstraint *constraint in self.constraints){
        if(constraint.firstItem == self.animatingTitleLabel){
            [self removeConstraint:constraint];
        }
    }
    
    ADD_CONSTRAINT(self, self.animatingTitleLabel, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self, NSLayoutAttributeCenterX, 1.f, 0);
    ADD_CONSTRAINT(self, self.animatingTitleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0);
    ADD_CONSTRAINT(self, self.animatingTitleLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
    
    [self.titleLabel removeFromSuperview];

}
-(void) popControllerPostAnimation {
    [self addSubview: self.titleLabel];
    
    self.titleLabel.text = self.animatingTitleLabel.text;
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self, NSLayoutAttributeCenterX, 1.f, 0);
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0);
    ADD_CONSTRAINT(self, self.titleLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0);
    
    [self.animatingTitleLabel removeFromSuperview];
    self.animatingTitleLabel = nil;
}

@end
