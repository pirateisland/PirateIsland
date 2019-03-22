//
//  HLHeatMapVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/22.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLHeatMapVC.h"

@interface HLHeatMapVC ()
/**球场*/
@property (nonatomic,strong) UIImageView * stadium;
/**热图*/
@property (nonatomic,strong) UIImageView * heatMap;
@end

@implementation HLHeatMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:HLChartLineColorStr];
    [self creatUI];
}
- (void)creatUI{
    self.stadium = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HLMatchReportStadiumOne"]];
    [self.view addSubview:self.stadium];
    self.stadium.contentMode = UIViewContentModeScaleAspectFit;
    [self.stadium mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(HLScreenWidth*0.7);
    }];
    
    self.heatMap = [[UIImageView alloc]init];
    [self.stadium addSubview:self.heatMap];
     self.heatMap.contentMode = UIViewContentModeScaleAspectFit;
    [self.heatMap mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    

    NSMutableArray * points = [NSMutableArray array];
    NSMutableArray * weights = [NSMutableArray array];

    for (NSInteger i = 0; i < 1000; i ++) {
        float X = [PLTool getRandomNumber:0 to:HLScreenWidth];
        float Y = [PLTool getRandomNumber:0 to:HLScreenWidth];
        [points addObject:[NSValue valueWithCGPoint:CGPointMake(X, Y)]];
        [weights addObject:[NSNumber numberWithInteger:[PLTool getRandomNumber:0 to:100]*100]];
    }
    self.heatMap.image = [UIImage heatMapWithRect:self.stadium.bounds boost:0.5 points:points weights:weights weightsAdjustmentEnabled:YES groupingEnabled:YES];
    
    
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
