//
//  POSFragment.h
//  POSsystem
//
//  Created by Andrew Charkin on 3/3/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POSCoordinatorDelegate.h"

@protocol POSFragmentDelegate <NSObject>
@property (weak, nonatomic) id<POSCoordinatorDelegate> coordinatorDelegate;
@end
