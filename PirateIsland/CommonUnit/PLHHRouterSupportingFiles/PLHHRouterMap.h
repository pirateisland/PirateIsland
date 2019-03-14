//
//  PLHHRouterMap.h
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/14.
//  Copyright © 2019 PL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLHHRouterMap : NSObject
+ (instancetype)shared;
-(void)registeredMap;
@end

NS_ASSUME_NONNULL_END
