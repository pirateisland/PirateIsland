//
//  PLShareView.h
//  PirateIsland
//
//  Created by yana on 2019/3/8.
//  Copyright © 2019 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PLShareViewItemType) {
    PLShareViewItemTypeOne,
    PLShareViewItemTypeTwo,
    PLShareViewItemTypeThree,
    PLShareViewItemOther
};

@interface PLShareView : UIView

@property (nonatomic, copy) void(^didSelectShareBtn)(PLShareViewItemType shareType);

/// 显示视图
- (void)show;

/// 关闭视图
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
