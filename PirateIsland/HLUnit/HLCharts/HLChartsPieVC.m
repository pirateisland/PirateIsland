//
//  HLChartsPieVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/29.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLChartsPieVC.h"

@interface HLChartsPieVC ()

@end

@implementation HLChartsPieVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self  creatUI];
}

- (void)creatUI{
    AAChartView * pieView = HLObject(AAChartView);
    [self.view addSubview:pieView];
    [pieView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [pieView aa_drawChartWithOptions:[self getOptions]];
}

- (AAOptions *)getOptions{
     bool bool_false = true;
    AAOptions * options = HLObject(AAOptions);
    
    options.seriesSet(@[
                        AASeriesElement.new
                        .nameSet(HLLanguage(@"语言热度值"))
                        .typeSet(AAChartTypePie)
                        .innerSizeSet(@"30%")//内部圆环半径大小占比
                        .sizeSet(@350)//尺寸大小
                        .borderWidthSet(@0)//描边的宽度
                        .visibleSet(true)
                        .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                        .statesSet(@{@"hover": @{@"enabled": @(bool_false)}})//禁用点击区块之后出现的半透明遮罩层 (先定义bool变量的原因是，直接用true，false，处理完成之后容易变成0或者1。https://www.cnblogs.com/haojuncong/p/4652998.html )
                        .dataSet(
                                 @[
                                   @[@"Firefox",   @3336.2],
                                   @[@"Others",    @223],
                                   @[@"IE",        @26.8],
                                   @[@"Safari",    @88.5],
                                   @[@"Opera",     @46.0],
                                   
                                   ]
                                 ),
                        ]);
    options.plotOptionsSet(
                           AAPlotOptions.new
                           .seriesSet(
                                                       AASeries.new.animationSet(
                                                                                 AAAnimation.new
                                                                                 .easingSet(AAChartAnimationEaseOutBounce)
                                                                                 .durationSet(@700)
                                                                                 )
                                                       )
                           .pieSet(
                                   AAPie.new
                                   .showInLegendSet(true)
                                   .dataLabelsSet(
                                                  AADataLabels.new
                                                  .enabledSet(false)
                                                  )
                                   )
                           );
    
    
    return options;
}



@end
