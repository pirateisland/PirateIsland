//
//  PLYanaViewController.m
//  PirateIsland
//
//  Created by yana on 2019/3/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLYanaViewController.h"
#import "PLCollectionView.h"
#import "UINavigationBar+Awesome.h"

@interface PLYanaViewController ()

@end

@implementation PLYanaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViews];
}

- (void)creatViews {
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"YANA";
    [self.navigationController.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:UIImage.new];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat kMagin = 10.0f;
    CGFloat kItemWidth = (kScreenWidth-(3*kMagin))*0.5;
    //设置单元格大小
    flowLayout.itemSize = CGSizeMake(kItemWidth, kItemWidth*0.618);
    //最小行间距
    flowLayout.minimumLineSpacing = kMagin;
    //最小item间距（
    flowLayout.minimumInteritemSpacing = kMagin;
    //设置senction的内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, kMagin, kMagin, kMagin);
    //设置UICollectionView的滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //sectionHeader的大小,如果是竖向滚动，只需设置Y值。如果是横向，只需设置X值。
    PLCollectionView *collectionView = [[PLCollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    __weak typeof(self) weakSelf = self;
    collectionView.viewDidScroll = ^(UIScrollView *scrollView) {
        UIColor *color = UIColor.cyanColor ;
        CGFloat offsetY = scrollView.contentOffset.y;
        CGFloat limitValue = 120.0f;
        if (offsetY < limitValue) {
            CGFloat alpha = offsetY/limitValue;
            [weakSelf.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
        } else {
            [weakSelf.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:1]];
        }
    };
}

@end
