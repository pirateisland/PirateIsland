//
//  PLCollectionView.h
//  PirateIsland
//
//  Created by yana on 2019/3/8.
//  Copyright © 2019 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLCollectionView : UICollectionView

@property (nonatomic, strong) void(^viewDidScroll)(UIScrollView *scrollView);

@end

NS_ASSUME_NONNULL_END
