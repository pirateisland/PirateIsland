//
//  HLChartsVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/25.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLChartsVC.h"

@interface HLChartsVC ()<UITableViewDelegate,UITableViewDataSource>
/**主体tab*/
@property (nonatomic,strong) UITableView * mainTableView;
/**数据*/
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation HLChartsVC
#pragma mark - lazy load
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _mainTableView;
}
#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"图表";
    self.dataArray = @[@"雷达图",@"饼状图",@"热力图",@"散点图",@"柱形范围图"];
    [self creatUI];
}

- (void)creatUI{
    
    [self.view addSubview:self.mainTableView];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource  =self;
    self.mainTableView.tableFooterView = [UIView new];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    
    
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//雷达图
        [self.rt_navigationController pushViewController:HLGetVC(M_HLChartsColumnVC) animated:YES complete:nil];
    }else if (indexPath.row == 1){//饼状图
        [self.rt_navigationController pushViewController:HLGetVC(M_HLChartsPieVC) animated:YES complete:nil];
    }else if (indexPath.row == 2){//热力图
        [self.rt_navigationController pushViewController:HLGetVC(M_HLHeatMapVC) animated:YES complete:nil];
    }else if (indexPath.row == 3){//散点图
        [self.rt_navigationController pushViewController:HLGetVC(M_HLChartsScatterVC) animated:YES complete:nil];
    }else if (indexPath.row == 4){//柱形范围图
        [self.rt_navigationController pushViewController:HLGetVC(M_HLChartsColumnrangeVC) animated:YES complete:nil];
    }
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
