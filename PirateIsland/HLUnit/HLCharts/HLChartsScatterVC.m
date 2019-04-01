//
//  HLChartsScatterVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/4/1.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLChartsScatterVC.h"

@interface HLChartsScatterVC ()

@end

@implementation HLChartsScatterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}
- (void)creatUI{
    AAChartView * pieView = HLObject(AAChartView);
    [self.view addSubview:pieView];
    [pieView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [pieView aa_drawChartWithChartModel:[self getModel]];
}

- (AAChartModel *)getModel{
    AAChartModel *aaChartModel = AAChartModel.new
    .markerRadiusSet(@6)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .chartTypeSet(AAChartTypeScatter)//图表类型
    .animationTypeSet(AAChartAnimationBounce)
    .titleSet(@"CHART SERIES HIDE OR SHOW")//图表主标题
    .subtitleSet(@"2020/08/08")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
                 AASeriesElement.new
                 .markerSet(AAMarker.new.symbolSet(@"circle"))
                 .nameSet(@"Tokyo Hot")
                 .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
                 AASeriesElement.new
                 .markerSet(AAMarker.new.symbolSet(@"square"))
                 .nameSet(@"Berlin Hot")
                 .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
                 AASeriesElement.new
                 .markerSet(AAMarker.new.symbolSet(@"diamond"))
                 .nameSet(@"London Hot")
                 .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
                 AASeriesElement.new
                 .markerSet(AAMarker.new.symbolSet(@"triangle"))
                 .nameSet(@"NewYork Hot")
                 .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
                 ]);
    return aaChartModel;
}

@end
