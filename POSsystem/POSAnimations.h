//
//  POSAnimations.h
//  POSsystem
//
//  Created by Andrew Charkin on 3/1/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POSAnimations : NSObject

+(void) animate: (NSArray *) newViews
withPercentages: (NSArray *) percentages
         inView: (UIView *) inView
    anchoringTo: (UIView *) anchor
  withAttribute: (NSInteger) anchorAttribute
   withConstant: (CGFloat) anchorConstant
appearRightToLeftofView: (UIView *) view
         during: (void (^)(void))during
          after: (void (^)(void))after;

+(void) animate: (NSArray *) newViews
withPercentages: (NSArray *) percentages
         inView: (UIView *) inView
    anchoringTo: (UIView *) anchor
  withAttribute: (NSInteger) anchorAttribute
   withConstant: (CGFloat) anchorConstant
appearLefttoRightofView: (UIView *) view
         during: (void (^)(void))during
          after: (void (^)(void))after;

@end
