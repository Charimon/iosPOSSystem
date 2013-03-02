//
//  POSSubCategoryViewController.m
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

#import "POSSubCategoryViewController.h"
#import "POSCollectionViewCell.h"
#import "POSConstants.h"

@interface POSSubCategoryViewController ()

@end

@implementation POSSubCategoryViewController

#pragma mark - getters/setters
@synthesize collectionView = _collectionView;
- (UICollectionView *) collectionView {
    if(_collectionView) return _collectionView;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [_collectionView registerClass:[POSCollectionViewCell class] forCellWithReuseIdentifier:COLLECTION_VIEW_CELL_IDENTIFIER];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    return _collectionView;
}

@synthesize data = _data;
-(NSMutableArray *) data {
    _data = [[NSMutableArray alloc] init];
    [_data addObject:[[NSMutableArray alloc] initWithObjects:@"Sofa", @"nicer sofa", @"sooper nice sofa", @"TEST", @"TEST", @"TEST", nil]];
    return _data;
}


#pragma mark - view methods
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view addSubview:self.collectionView];
    
    ADD_CONSTRAINT(self.view, self.collectionView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.collectionView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.collectionView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f);
    ADD_CONSTRAINT(self.view, self.collectionView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.data count];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.data objectAtIndex:section] count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    POSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:COLLECTION_VIEW_CELL_IDENTIFIER forIndexPath:indexPath];
    if(cell == nil) cell = [[POSCollectionViewCell alloc] init];
    
    NSString *dataValue = [[self.data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = dataValue;
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.coordinatorDelegate subCategoryClicked];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(188.f, 188.f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 14.f;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(14.f, 14.f, 14.f, 14.f);
}

@end
