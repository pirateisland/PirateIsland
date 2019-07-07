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
#import "HLChartsScatterVC.h"
#import "HLChartsColumnrangeVC.h"
#import "HLInternationaLizationVC.h"
#import "PLHanLinDalyTestVC.h"
#import "PLHLCameraAndPhotoVC.h"

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
    [[HHRouter shared] map:M_HLChartsScatterVC toControllerClass:[HLChartsScatterVC class]];//散点图
    [[HHRouter shared] map:M_HLChartsColumnrangeVC toControllerClass:[HLChartsColumnrangeVC class]];//柱形范围图
    [[HHRouter shared] map:M_HLInternationaLizationVC toControllerClass:[HLInternationaLizationVC class]];//国际化
    [[HHRouter shared] map:M_HLDalyTestVC toControllerClass:[PLHanLinDalyTestVC class]];//日常测试控制器
    [[HHRouter shared] map:M_PLHLCameraAndPhotoVC toControllerClass:[PLHLCameraAndPhotoVC class]];//相机和相册
}
@end
