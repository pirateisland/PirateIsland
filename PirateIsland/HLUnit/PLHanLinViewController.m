//
//  PLHanLinViewController.m
//  PirateIsland
//
//  Created by yana on 2019/3/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLHanLinViewController.h"

@interface PLHanLinViewController ()<UITableViewDelegate,UITableViewDataSource>
/**table*/
@property (nonatomic,strong) UITableView * hlTableView;
/**数据源*/
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation PLHanLinViewController
#pragma mark - lazy load
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray new];
    }
    return _dataArray;
}
- (UITableView *)HlTableView{
    if (!_hlTableView) {
        _hlTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _hlTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = HLLanguage(@"是翰林啊");
    self.navigationItem.titleView.backgroundColor = HLRandomColor;
    self.dataArray = @[@"图表",@"国际化",@"地图",@"日常测试",@"相机和相册"];
    [self creatUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:changeLanguageNoticeKey object:nil];
    self.view.backgroundColor = [UIColor colorWithHexString:HLChartLineColorStr];
 
}

#pragma mark - UI about
- (void)creatUI{
    self.hlTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.hlTableView];
    self.hlTableView.delegate = self;
    self.hlTableView.dataSource = self;
    self.hlTableView.tableFooterView = [UIView new];
    [self.hlTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    cell.textLabel.text = HLLanguage(self.dataArray[indexPath.row]);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        [self.rt_navigationController pushViewController:HLGetVC(M_HLChartsVC) animated:YES complete:nil];
    }else if (indexPath.row == 1){
        [self.rt_navigationController pushViewController:HLGetVC(M_HLInternationaLizationVC) animated:YES complete:nil];
    }else if (indexPath.row == 3){
        [self.rt_navigationController pushViewController:HLGetVC(M_HLDalyTestVC) animated:YES complete:nil];
    }else if (indexPath.row == 4){
        [self.rt_navigationController pushViewController:HLGetVC(M_PLHLCameraAndPhotoVC) animated:YES complete:nil];
    }
}









- (void)changeLanguage{
    [self.hlTableView reloadData];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.navigationController pushViewController:[[HHRouter shared ] matchController:M_PLHLSecViewController] animated:YES];
}
@end
