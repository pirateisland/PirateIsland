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
#import "HLChartsVC.h"
#import "HLChartsPieVC.h"
#import "HLChartsColumnVC.h"

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
    [[HHRouter shared] map:M_HLHeatMapVC toControllerClass:[HLHeatMapVC class]];//热力图
    [[HHRouter shared] map:M_HLChartsVC toControllerClass:[HLChartsVC class]];//图表
    [[HHRouter shared] map:M_HLChartsPieVC toControllerClass:[HLChartsPieVC class]];//饼状图
    [[HHRouter shared] map:M_HLChartsColumnVC toControllerClass:[HLChartsColumnVC class]];//雷达图
}
@end
