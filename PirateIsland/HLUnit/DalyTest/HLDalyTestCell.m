//
//  HLDalyTestCell.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/6/28.
//  Copyright © 2019 PL. All rights reserved.
//

#import "HLDalyTestCell.h"

@implementation HLDalyTestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        self.textLabel.text = @"选中";
        self.textLabel.textColor = [UIColor redColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.backgroundColor = [UIColor lightGrayColor];
    } else {
        self.textLabel.text = @"somebody help!";
        self.textLabel.textColor = [UIColor blackColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
