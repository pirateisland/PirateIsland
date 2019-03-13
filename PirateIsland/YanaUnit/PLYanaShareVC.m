//
//  PLYanaShareVC.m
//  PirateIsland
//
//  Created by yana on 2019/3/8.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLYanaShareVC.h"
#import "PLShareView.h"

@interface PLYanaShareVC ()

@end

@implementation PLYanaShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分享";
    [self.navigationController.navigationBar setBarTintColor:UIColor.yellowColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    PLShareView *shareView = [[PLShareView alloc] init];
    [shareView show];
    shareView.didSelectShareBtn = ^(PLShareViewItemType shareType) {
        NSLog(@"shareType == %ld",shareType);
    };
}
@end
