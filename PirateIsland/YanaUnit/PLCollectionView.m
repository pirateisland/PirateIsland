//
//  PLCollectionView.m
//  PirateIsland
//
//  Created by yana on 2019/3/8.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLCollectionView.h"
#import "PLCollectionViewCell.h"

@interface PLCollectionView () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation PLCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self configureViews];
    }
    return self;
}

- (void)configureViews {
    self.backgroundColor = UIColor.whiteColor;
    [self registerClass:PLCollectionViewCell.class forCellWithReuseIdentifier:kCollectionCellReuseIdenti];
    self.dataSource = self;
    self.delegate = self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PLCollectionViewCell *collenctionCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellReuseIdenti forIndexPath:indexPath];
    return collenctionCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    !self.viewDidSelectItem?:self.viewDidSelectItem(indexPath);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.viewDidScroll?:self.viewDidScroll(scrollView);
}


@end
