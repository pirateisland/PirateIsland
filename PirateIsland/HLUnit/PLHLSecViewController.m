//
//  PLHLSecViewController.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/14.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLHLSecViewController.h"

@interface PLHLSecViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
/**<#请完善备注信息#>*/
@property (nonatomic,strong) UICollectionView * hlCollectionView;
/**<#请完善备注信息#>*/
@property (nonatomic,strong) NSMutableArray * dateArray;
@end

@implementation PLHLSecViewController
- (NSMutableArray *)dateArray{
    if (!_dateArray) {
        _dateArray = [NSMutableArray array];
    }
    return _dateArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    for (NSInteger i = 0; i < 53; i ++) {
        [self.dateArray addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    [self creatUI];
}

- (void)creatUI{
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(HLScreenWidth/self.dateArray.count, 100);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.hlCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.hlCollectionView];
    self.hlCollectionView.backgroundColor = [UIColor redColor];
    self.hlCollectionView.delegate = self;
    self.hlCollectionView.dataSource = self;
    [self.hlCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.hlCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dateArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];;
    return cell;
}
@end
