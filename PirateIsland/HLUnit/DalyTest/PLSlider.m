//
//  PLSlider.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/9/6.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLSlider.h"
@interface PLSlider ()
/** <#Description#> */
@property(nonatomic,strong)UIView * prograssView;
@end
@implementation PLSlider
- (UIView *)prograssView{
    if (!_prograssView) {
        _prograssView = [UIView new];
    }
    return _prograssView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    self.backgroundColor = [UIColor redColor];
    UIView * colorView = [UIView new];
    [self addSubview:colorView];
    colorView.backgroundColor = HLRandomColor;
    [self bringSubviewToFront:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(5);
    }];
    
    self.minimumTrackTintColor = HLCleanBackGroundColor;
    self.maximumTrackTintColor = HLCleanBackGroundColor;
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
