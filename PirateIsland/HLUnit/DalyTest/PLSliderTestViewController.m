//
//  PLSliderTestViewController.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/9/6.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLSliderTestViewController.h"
#import "PLSlider.h"
@interface PLSliderTestViewController ()
/** <#Description#> */
@property(nonatomic,strong)PLSlider * slider;
@end

@implementation PLSliderTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}

- (void)creatUI{
    self.slider = [PLSlider new];
    [self.view addSubview:self.slider];
    self.slider.backgroundColor = HLRandomColor;
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    
    
   
    
    
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
