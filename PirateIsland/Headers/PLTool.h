//
//  PLTool.h
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/22.
//  Copyright © 2019 PL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLTool : NSObject
/**
 获取当前控制器
 
 @return 获取到的当前控制器
 */
+ (UIViewController *)currentVC;
#pragma mark - 获取当前语言
/**
 获取当前语言
 
 @return 当前语言代码
 */
+ (NSString *)getCurrentLanguage;
#pragma mark - toast展示
/**
 展示底部toast
 
 @param message 需要展示的内容
 */
+ (void)showBottomMessage:(NSString *)message;
/**
 展示顶部toast
 
 @param message 需要展示的内容
 */
+ (void)showTopMessage:(NSString *)message;
/**
 展示屏幕中间toast
 
 @param message 需要展示的内容
 */

+ (void)showCenterMessage:(NSString *)message;
#pragma mark - 获取随机数
/**
 获取指定范围的随机数
 
 @param from 起始点
 @param to 结束点
 @return 获取到的随机数
 */
+(int)getRandomNumber:(int)from to:(int)to;
@end

NS_ASSUME_NONNULL_END
