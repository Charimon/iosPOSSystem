//
//  POSNavigationBar.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol POSNavigationBarDelegate <NSObject>

-(void) navigationBarPopViewController: (UIButton *) button;
-(void) cartButtonClicked: (UIButton *) button;
-(void) userButtonClicked: (UIButton *) button;
-(void) scannerButtonClicked: (UIButton *) button;

//Type: NSMutableArray[UIViewController*]
@property (nonatomic, strong) NSMutableArray* controllerStack;

@end

@interface POSNavigationBar : UIView

@property (strong, nonatomic) UIButton *cartButton;
@property (strong, nonatomic) UIButton *userButton;
@property (strong, nonatomic) UIButton *scannerButton;

//make sure both of these methods happen, otherwise UI will be in a weird state
-(void) pushControllerDuringAnimation;
-(void) pushControllerPostAnimation:(NSString *)name;


//make sure all of these methods happen, otherwise UI will be in a weird state
-(NSInteger) popControllerPreAnimation: (UIButton *) button;
-(void) popControllerDuringAnimation;
-(void) popControllerPostAnimation;


- (id)initWithDefaultTitle: (NSString *) title;

@property (weak, nonatomic) id<POSNavigationBarDelegate> delegate;

@end
