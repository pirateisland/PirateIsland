//
//  PLHanLinViewController.m
//  PirateIsland
//
//  Created by yana on 2019/3/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLHanLinViewController.h"

@interface PLHanLinViewController ()

@end

@implementation PLHanLinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.yellowColor;
    self.navigationItem.title = @"HANLIN";
    NSLog(@"this is mine");
    NSLog(@"%@",self.navigationController);
    self.view.backgroundColor = [UIColor colorWithHexString:HLChartLineColorStr];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.view.backgroundColor = HLRandomColor;
    [self.navigationController pushViewController:[[HHRouter shared ] matchController:M_PLHLSecViewController] animated:YES];
}
@end
