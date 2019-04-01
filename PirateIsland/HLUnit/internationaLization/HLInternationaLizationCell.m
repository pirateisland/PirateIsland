//
//  HLInternationaLizationCell.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/4/1.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLInternationaLizationCell.h"
@interface HLInternationaLizationCell ()

@end
@implementation HLInternationaLizationCell
#pragma mark - lazy load ...
- (UISwitch *)hlSwitch{
    if (!_hlSwitch) {
        _hlSwitch = [[UISwitch alloc]init];
    }
    return _hlSwitch;
}
#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return  self;
}
- (void)creatUI{
    [self.contentView addSubview:self.hlSwitch];
    [self.hlSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-20);
    }];
    [self.hlSwitch addTarget:self action:@selector(hlSwitchClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)hlSwitchClick:(UISwitch*)sender{
    if (!sender.on) {
        [self.hlSwitch setOn:YES];
        [PLTool showCenterMessage:@"必须选择一项"];
        return;
    }
    if (self.hlSwitchClickBlock && sender.on) {
        self.hlSwitchClickBlock(sender.on);
    }
}
@end
