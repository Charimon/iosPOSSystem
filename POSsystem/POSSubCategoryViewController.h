//
//  POSSubCategoryViewController.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSCoordinatorDelegate.h"
#import "POSFragmentDelegate.h"

@interface POSSubCategoryViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, POSFragmentDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;


//type: NSMutableArray[NSMutableArray[NSString *]]
@property (strong, nonatomic) NSMutableArray *data;
@end
