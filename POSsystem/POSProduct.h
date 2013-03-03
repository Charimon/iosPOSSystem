//
//  POSProduct.h
//  POSsystem
//
//  Created by Andrew Charkin on 3/3/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POSProduct : NSObject
//mongoId, sqlId, w/e
@property (strong, nonatomic) NSString *dataId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSString *imageUrlString;
@end
