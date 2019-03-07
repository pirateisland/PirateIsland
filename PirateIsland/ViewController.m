//
//  ViewController.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 130, 30)];
    label.text = @"ViewController.h";
    label.textColor = UIColor.yellowColor;
    label.backgroundColor = UIColor.redColor;
    label.font = [UIFont boldSystemFontOfSize:30.0f];
    [self.view addSubview:label];
}


@end
