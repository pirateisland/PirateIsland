//
//  HLInternationaLizationVC.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/4/1.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLInternationaLizationVC.h"
#import "HLInternationaLizationCell.h"

@interface HLInternationaLizationVC ()<UITableViewDelegate,UITableViewDataSource>
/**<#请完善备注信息#>*/
@property (nonatomic,strong) UITableView * mainTableView;
/**<#请完善备注信息#>*/
@property (nonatomic,strong) NSArray * dataArray;
/**<#请完善备注信息#>*/
@property (nonatomic,strong) NSMutableArray * switchStateArray;
@end

@implementation HLInternationaLizationVC
- (NSMutableArray *)switchStateArray{
    if (!_switchStateArray) {
        _switchStateArray = [NSMutableArray array];
    }
    return _switchStateArray;
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _mainTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = @[@"中文",@"英文",@"跟随系统"];
    [self creatUI];
}

- (void)creatUI{
    [self.view addSubview:self.mainTableView];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.tableFooterView = [UIView new];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{HLWeakSelf;
    HLInternationaLizationCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[HLInternationaLizationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.section];
    cell.hlSwitchClickBlock = ^(BOOL isON) {
        [weakSelf changeCellWithIndexPath:indexPath];
    };
    NSString * languageStr = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageKey];
    if ([languageStr isEqualToString:@"zh-Hans"]&&indexPath.section == 0) {
        [cell.hlSwitch setOn:YES];
        [self cnLanguage];
    }else if ([languageStr isEqualToString:@"en"]&&indexPath.section == 1){
        [cell.hlSwitch setOn:YES];
        [self enLanguage];
    }else if ([languageStr isEqualToString:@"zh-Hans-CN"]&&indexPath.section == 2){
        [cell.hlSwitch setOn:YES];
        [self sysLanguage];
    }
    
    return cell;
}

- (void)cnLanguage{
    [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:LanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [HLBundle setLanguage: [[NSUserDefaults standardUserDefaults] objectForKey:LanguageKey]];
    
}
- (void)enLanguage{
    [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:LanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [HLBundle setLanguage: [[NSUserDefaults standardUserDefaults] objectForKey:LanguageKey]];
}
- (void)sysLanguage{
    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *languageName = [appLanguages objectAtIndex:0];
    [[NSUserDefaults standardUserDefaults] setObject:languageName forKey:LanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [HLBundle setLanguage: [[NSUserDefaults standardUserDefaults] objectForKey:LanguageKey]];
}
- (void)changeCellWithIndexPath:(NSIndexPath*)indexPath{
    NSArray *arr = [self.mainTableView indexPathsForVisibleRows];
    for (NSIndexPath *OtherIndexPath in arr) {
        //根据索引，获取cell 然后就可以做你想做的事情啦
        if (OtherIndexPath != indexPath) {
            HLInternationaLizationCell *cell = [self.mainTableView cellForRowAtIndexPath:OtherIndexPath];
            [cell.hlSwitch setOn:NO];
        }
    }
    if (indexPath.section == 0) {//中文
        [self cnLanguage];
    }else if (indexPath.section == 1){//英文
        [self enLanguage];
    }else if (indexPath.section == 2){//跟随系统
        [self sysLanguage];
    }
    [PLTool showCenterMessage:@"切换成功"];
    [[NSNotificationCenter defaultCenter] postNotificationName:changeLanguageNoticeKey object:nil];
}

@end
