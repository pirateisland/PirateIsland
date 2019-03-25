//
//  HLChartsVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/25.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLChartsVC.h"

@interface HLChartsVC ()

@end

@implementation HLChartsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"图表";
    self.view.backgroundColor = HLRandomColor;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.view.backgroundColor = HLRandomColor;
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
