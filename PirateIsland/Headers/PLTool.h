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
