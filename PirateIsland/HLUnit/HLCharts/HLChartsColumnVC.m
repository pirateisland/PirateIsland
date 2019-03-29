//
//  HLChartsColumnVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/29.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLChartsColumnVC.h"

@interface HLChartsColumnVC ()

@end

@implementation HLChartsColumnVC

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
    .chartTypeSet(AAChartTypeColumn)
    .polarSet(true)
    .seriesSet(@[
                 AASeriesElement.new
                 .nameSet(@"Column")
                 .typeSet(AAChartTypeColumn)
                 .dataSet(@[@8, @7, @6, @5, @4, @3, @2, @1]),
                 AASeriesElement.new
                 .nameSet(@"Line")
                 .typeSet(AAChartTypeLine)
                 .dataSet(@[@1, @2, @3, @4, @5, @6, @7, @8]),
                 AASeriesElement.new
                 .nameSet(@"Area")
                 .typeSet(AAChartTypeArea)
                 .dataSet(@[@1, @8, @2, @7, @3, @6, @4, @5])
                 ]);
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
