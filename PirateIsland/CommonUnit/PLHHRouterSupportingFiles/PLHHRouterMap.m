//
//  PLHHRouterMap.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/14.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLHHRouterMap.h"
#import "PLHLSecViewController.h"
#import "HLHeatMapVC.h"

@implementation PLHHRouterMap
+ (instancetype)shared
{
    static PLHHRouterMap *routerMap = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!routerMap) {
            routerMap = [[self alloc] init];
           
        }
    });
    return routerMap;
}
-(void)registeredMap{
    [[HHRouter shared] map:M_PLHLSecViewController toControllerClass:[PLHLSecViewController class]];
    [[HHRouter shared] map:M_HLHeatMapVC toControllerClass:[HLHeatMapVC class]];
}
@end
