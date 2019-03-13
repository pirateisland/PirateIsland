//
//  PLShareView.m
//  PirateIsland
//
//  Created by yana on 2019/3/8.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLShareView.h"
#import "PLShareButton.h"

@interface PLShareView ()

@property (nonatomic, strong) UIView *shareView;

@end

@implementation PLShareView

static CGFloat kSelfHeight = 200.0f;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
        [self setUp];
    }
    return self;
}

- (void)setUp {
    // 背景Btn
    UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    bgBtn.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kSelfHeight);
    [bgBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bgBtn];
    [bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    // 分享视图
    self.shareView = ({
        UIView *shareView = [[UIView alloc] init];
        shareView.backgroundColor = [UIColor whiteColor];
        [self addSubview:shareView];
        [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(kSelfHeight);
        }];
        shareView;
    });
    
    // topView
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    topView.backgroundColor = HEXColor(0xF6F7F8);
    [self.shareView addSubview:topView];
    
    // 关闭Btn
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(0, topView.bottom, kScreenWidth, 50);
    closeBtn.backgroundColor = [UIColor whiteColor];
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    [closeBtn setTitle:@"取消" forState:UIControlStateNormal];
    [closeBtn setTitleColor:HEXColor(0x333333) forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.shareView addSubview:closeBtn];
    
    // 设置数据
    [self setDataSourceWithTopView:topView];
}

- (void)setDataSourceWithTopView:(UIView *)topView {
    CGFloat originX = 15.0f;
    for (NSInteger i = 0; i<6; i++) {
        int R = (arc4random() % 256);
        int G = (arc4random() % 256);
        int B = (arc4random() % 256);
        PLShareButton *shareItem = [PLShareButton buttonWithType:UIButtonTypeCustom];
        shareItem.frame = CGRectMake(originX, 40.0f, 47.0f, 90.0f);
        shareItem.tag = i;
        shareItem.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
        [topView addSubview:shareItem];
        originX += 63.0f;
        [shareItem addTarget:self action:@selector(shareItemClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)shareItemClick:(PLShareButton *)shareItemBtn{
    !self.didSelectShareBtn?:self.didSelectShareBtn(shareItemBtn.tag);
}

// 显示
- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    NSTimeInterval delay = 0.1;
    for (UIView *subView in self.shareView.subviews) {
        if ([subView isKindOfClass:[UIView class]]) {
            UIView *topView = (UIView *)subView;
            for (UIView *subView in topView.subviews) {
                if ([subView isKindOfClass:[PLShareButton class]]) {
                    delay += 0.1;
                    PLShareButton *shareBtn = (PLShareButton *)subView;
                    [shareBtn shakeBtnWithDely:delay];
                }
            }
        }
    }
    self.alpha = 0.0f;
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 1.0f;
//        self.shareView.frame = CGRectMake(0, kScreenHeight - kSelfHeight, kScreenWidth, kSelfHeight);
        [self.shareView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(kSelfHeight);
        }];
    }];
}

// 关闭
- (void)dismiss{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.0f;
//        self.shareView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kSelfHeight);
        [self.shareView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(kSelfHeight);
        }];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)dealloc{
    NSLog(@"%@ -- dealoc", NSStringFromClass([self class]));
}

@end
