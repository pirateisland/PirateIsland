//
//  PLCollectionViewCell.m
//  PirateIsland
//
//  Created by yana on 2019/3/8.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLCollectionViewCell.h"

@implementation PLCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatViews];
    }
    return self;
}

- (void)creatViews {
    self.contentView.backgroundColor = UIColor.lightGrayColor;
}

@end
