//
//  HLChartsColumnrangeVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/4/1.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLChartsColumnrangeVC.h"

@interface HLChartsColumnrangeVC ()

@end

@implementation HLChartsColumnrangeVC

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
    AAChartModel *aaChartModel= AAChartModel.new
    .titleSet(HLLanguage(@"城市气温指数"))
    .subtitleSet(HLLanguage(@"虚拟数据"))
    .yAxisTitleSet(HLLanguage(@"摄氏度"))
    .invertedSet(true)
    .markerRadiusSet(@6)
    .yAxisVisibleSet(true)
    .yAxisGridLineWidthSet(@0)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .chartTypeSet(AAChartTypeLine)
    .categoriesSet(@[HLLanguage(@"一月"), HLLanguage(@"二月"), HLLanguage(@"三月"), HLLanguage(@"四月"), HLLanguage(@"五月"), HLLanguage(@"六月"), HLLanguage(@"七月"), HLLanguage(@"八月"), HLLanguage(@"九月"),HLLanguage( @"十月"), HLLanguage(@"十一月"), HLLanguage(@"十二月")])
    .dataLabelEnabledSet(true)
    .colorsThemeSet(@[@"#1e90ff",@"#EA007B", @"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81",])
    .seriesSet(@[
                 AASeriesElement.new
                 .typeSet(AAChartTypeColumnrange)
                 .nameSet(HLLanguage(@"温度"))
                 .dataSet(@[
                            @[@(-9.7), @9.4],
                            @[@(-8.7), @6.5],
                            @[@(-3.5), @9.4],
                            @[@(-1.4),@19.9],
                            @[@0.0 ,  @22.6],
                            @[@2.9 ,  @29.5],
                            @[@9.2 ,  @30.7],
                            @[@7.3 ,  @26.5],
                            @[@4.4 ,  @18.0],
                            @[@(-3.1),@11.4],
                            @[@(-5.2),@10.4],
                            @[@(-9.9),@16.8],
                            ]),
                 ]
               )
    ;
    return aaChartModel;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
