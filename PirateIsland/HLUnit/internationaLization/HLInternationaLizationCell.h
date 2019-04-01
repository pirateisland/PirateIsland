//
//  HLInternationaLizationCell.h
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/4/1.
//  Copyright © 2019 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^HlSwitchClickBlock)(BOOL isON);


@interface HLInternationaLizationCell : UITableViewCell
/**<#请完善备注信息#>*/
@property (nonatomic,strong) UISwitch * hlSwitch;
/**<#请完善备注信息#>*/
@property (nonatomic,copy) HlSwitchClickBlock  hlSwitchClickBlock;
@end

NS_ASSUME_NONNULL_END
