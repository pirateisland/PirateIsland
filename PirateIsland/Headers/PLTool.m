//
//  PLTool.m
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/22.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLTool.h"

@implementation PLTool
+ (UIViewController *)currentVC
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    //当前windows的根控制器
    UIViewController *controller = window.rootViewController;
    
    //通过循环一层一层往下查找
    while (YES) {
        //先判断是否有present的控制器
        if (controller.presentedViewController) {
            //有的话直接拿到弹出控制器，省去多余的判断
            controller = controller.presentedViewController;
        } else {
            if ([controller isKindOfClass:[UINavigationController class]]) {
                //如果是NavigationController，取最后一个控制器（当前）
                controller = [controller.childViewControllers lastObject];
            } else if ([controller isKindOfClass:[UITabBarController class]]) {
                //如果TabBarController，取当前控制器
                UITabBarController *tabBarController = (UITabBarController *)controller;
                controller = tabBarController.selectedViewController;
            } else {
                if (controller.childViewControllers.count > 0) {
                    //如果是普通控制器，找childViewControllers最后一个
                    controller = [controller.childViewControllers lastObject];
                } else {
                    //没有present，没有childViewController，则表示当前控制器
                    return controller;
                }
            }
        }
    }
}

+ (NSString *)getCurrentLanguage{
    return [[NSUserDefaults standardUserDefaults] objectForKey:LanguageKey];
}
+ (void)showBottomMessage:(NSString *)message
{
    [HLWindow makeToast:HLLanguage(message) duration:1 position:CSToastPositionBottom];
}

+ (void)showTopMessage:(NSString *)message
{
    [HLWindow makeToast:HLLanguage(message) duration:1 position:CSToastPositionTop];
}

+ (void)showCenterMessage:(NSString *)message
{
    [HLWindow makeToast:HLLanguage(message) duration:1 position:CSToastPositionCenter];
}
/**
 获取指定范围的随机数
 
 @param from 起始点
 @param to 结束点
 @return 获取到的随机数
 */
+(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}
@end
