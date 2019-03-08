//
//  PLTabBarController.m
//  PirateIsland
//
//  Created by yana on 2019/3/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLTabBarController.h"
#import "PLYanaViewController.h"
#import "PLHanLinViewController.h"

@interface PLTabBarController ()

@end

@implementation PLTabBarController

- (instancetype)init {
    if (!(self = [super init])) {
        return nil;
    }
    CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.rootViewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController];
    [self customizeTabBarAppearance:tabBarController];
    
    return (self = (PLTabBarController *)tabBarController);
}

- (NSArray *)rootViewControllers {
    UIViewController *firstNavi = [[RTContainerNavigationController alloc] initWithRootViewController:[[PLYanaViewController alloc] init]];
    UIViewController *twoNavi = [[RTContainerNavigationController alloc] initWithRootViewController:[[PLHanLinViewController alloc] init]];
    NSArray *viewControllers = @[firstNavi, twoNavi];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"YANA",
                                                 CYLTabBarItemImage : @"home_yana_normal",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"home_yana_select"  /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"HANL",
                                                  CYLTabBarItemImage : @"home_hanlin_normal",
                                                  CYLTabBarItemSelectedImage : @"home_hanlin_select"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/** 更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = UIColor.grayColor; // 灰色
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = UIColor.cyanColor;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    //    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    //    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    //FIXED: #196
    //    UIImage *tabBarBackgroundImage = [UIImage imageNamed:@"tab_bar"];
    //    UIImage *scanedTabBarBackgroundImage = [[self class] scaleImage:tabBarBackgroundImage toScale:1.0];
    //     [tabBarAppearance setBackgroundImage:scanedTabBarBackgroundImage];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
    //    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}


@end
