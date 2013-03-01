//
//  POSAnimations.m
//  POSsystem
//
//  Created by Andrew Charkin on 3/1/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSAnimations.h"
#import "POSConstants.h"

@implementation POSAnimations

//new view will slide in from the right to occupy entire Space
+(void) animate: (UIView *) newView inView: (UIView *) inView appearRightToLeftofView: (UIView *) view during: (void (^)(void))during after: (void (^)(void))after {
    
    [POSAnimations animate:[NSArray arrayWithObject:newView]
           withPercentages:[NSArray arrayWithObject:[NSNumber numberWithFloat:1.f]]
                    inView:inView
   appearRightToLeftofView:view
                    during:during
                     after:after];
}

/*
 * newViews : NSArray[UIView *]
 * percentages : NSArray[NSNumber *]
 */
+(void) animate: (NSArray *) newViews withPercentages: (NSArray *) percentages inView: (UIView *) inView appearRightToLeftofView: (UIView *) view during: (void (^)(void))during after: (void (^)(void))after {
    
    NSUInteger i=0;
    for(UIView * newView in newViews) {
        
        if(i==0) {
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeLeading, NSLayoutRelationEqual, view, NSLayoutAttributeTrailing, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeBottom, NSLayoutRelationEqual, view, NSLayoutAttributeBottom, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeTop, NSLayoutRelationEqual, view, NSLayoutAttributeTop, 1.f, 0);
        } else {
            UIView *prevView = [newViews objectAtIndex:i-1];
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeLeading, NSLayoutRelationEqual, prevView, NSLayoutAttributeTrailing, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeBottom, NSLayoutRelationEqual, prevView, NSLayoutAttributeBottom, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeTop, NSLayoutRelationEqual, prevView, NSLayoutAttributeTop, 1.f, 0);
        }
        
        CGFloat width = [[percentages objectAtIndex:i++] floatValue];
        ADD_CONSTRAINT(inView, newView, NSLayoutAttributeWidth, NSLayoutRelationEqual, inView, NSLayoutAttributeWidth, width, 0);
        
        
    }
    
    [inView layoutIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        for(NSLayoutConstraint *constraint in inView.constraints){
            if(constraint.firstItem == view && (constraint.firstAttribute == NSLayoutAttributeTrailing ||
                                                constraint.firstAttribute == NSLayoutAttributeLeading ||
                                                constraint.firstAttribute == NSLayoutAttributeWidth)){
                [inView removeConstraint:constraint];
            }
        }
        during();
        
        ADD_CONSTRAINT(inView, view, NSLayoutAttributeTrailing, NSLayoutRelationEqual, inView, NSLayoutAttributeLeading, 1.f, 0);
        ADD_CONSTRAINT(inView, view, NSLayoutAttributeWidth, NSLayoutRelationEqual, inView, NSLayoutAttributeWidth, 1.f, 0);
        
        [inView layoutIfNeeded];
    } completion:^(BOOL finished){
        for(NSLayoutConstraint *constraint in inView.constraints){
            if(constraint.firstItem == [newViews objectAtIndex:0] && (constraint.firstAttribute == NSLayoutAttributeLeading ||
                                                                      constraint.firstAttribute == NSLayoutAttributeBottom ||
                                                                      constraint.firstAttribute == NSLayoutAttributeTop)) [inView removeConstraint:constraint];
        }
        ADD_CONSTRAINT(inView, [newViews objectAtIndex:0], NSLayoutAttributeLeading, NSLayoutRelationEqual, inView, NSLayoutAttributeLeading, 1.f, 0);
        
        after();
    }];
}

//new view will slide in from the left to occupy entire Space
+(void) animate: (UIView *) newView inView: (UIView *) inView appearLefttoRightofView: (UIView *) view during: (void (^)(void))during after: (void (^)(void))after {
    
    [POSAnimations animate:[NSArray arrayWithObject:newView]
           withPercentages:[NSArray arrayWithObject:[NSNumber numberWithFloat:1.f]]
                    inView:inView
   appearLefttoRightofView:view
                    during:during
                     after:after];
}

/*
 * newViews : NSArray[UIView *]
 * percentages : NSArray[NSNumber *]
 */
+(void) animate: (NSArray *) newViews withPercentages: (NSArray *) percentages inView: (UIView *) inView appearLefttoRightofView: (UIView *) view during: (void (^)(void))during after: (void (^)(void))after {
    
    NSUInteger i=0;
    for(UIView * newView in newViews) {
        if(i==0) {
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, view, NSLayoutAttributeLeading, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeBottom, NSLayoutRelationEqual, view, NSLayoutAttributeBottom, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeTop, NSLayoutRelationEqual, view, NSLayoutAttributeTop, 1.f, 0);
        } else {
            UIView *prevView = [newViews objectAtIndex:i-1];
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, prevView, NSLayoutAttributeLeading, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeBottom, NSLayoutRelationEqual, prevView, NSLayoutAttributeBottom, 1.f, 0);
            ADD_CONSTRAINT(inView, newView, NSLayoutAttributeTop, NSLayoutRelationEqual, prevView, NSLayoutAttributeTop, 1.f, 0);
        }
        
        CGFloat width = [[percentages objectAtIndex:i++] floatValue];
        ADD_CONSTRAINT(inView, newView, NSLayoutAttributeWidth, NSLayoutRelationEqual, inView, NSLayoutAttributeWidth, width, 0);
    }
    
    [inView layoutIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        for(NSLayoutConstraint *constraint in inView.constraints){
            if(constraint.firstItem == view && (constraint.firstAttribute == NSLayoutAttributeTrailing ||
                                                constraint.firstAttribute == NSLayoutAttributeLeading ||
                                                constraint.firstAttribute == NSLayoutAttributeWidth)){
                [inView removeConstraint:constraint];
            }
        }
        during();
        
        ADD_CONSTRAINT(inView, view, NSLayoutAttributeLeading, NSLayoutRelationEqual, inView, NSLayoutAttributeTrailing, 1.f, 0);
        ADD_CONSTRAINT(inView, view, NSLayoutAttributeWidth, NSLayoutRelationEqual, inView, NSLayoutAttributeWidth, 1.f, 0);
        
        [inView layoutIfNeeded];
    } completion:^(BOOL finished){
        for(NSLayoutConstraint *constraint in inView.constraints){
            if(constraint.firstItem == [newViews objectAtIndex:0] && (constraint.firstAttribute == NSLayoutAttributeTrailing ||
                                                                      constraint.firstAttribute == NSLayoutAttributeBottom ||
                                                                      constraint.firstAttribute == NSLayoutAttributeTop)) [inView removeConstraint:constraint];
        }
        ADD_CONSTRAINT(inView, [newViews objectAtIndex:0], NSLayoutAttributeTrailing, NSLayoutRelationEqual, inView, NSLayoutAttributeTrailing, 1.f, 0);
        
        after();
    }];
}


@end
