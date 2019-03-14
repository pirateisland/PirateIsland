//
//  HLHeader.h
//  PirateIsland
//
//  Created by huaxingyunrui on 2019/3/14.
//  Copyright © 2019 PL. All rights reserved.
//

#ifndef HLHeader_h
#define HLHeader_h

#define HLWeakSelf  __weak typeof(self) weakSelf = self;
///=============================================================================
/// @name NSLog相关
///=============================================================================
#ifdef DEBUG
#define HLLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif
///=============================================================================

///=============================================================================
/// @name 字体、颜色相关
///=============================================================================
#define HLCleanBackGroundColor  [UIColor colorWithWhite:1.f alpha:0.f]
#define HLMainBackColor         [UIColor colorWithHexString:@"174b76"]//通用的主体背景颜色
#define HLChartLineColorStr     @"#8a98a3"//图表的线条颜色
#define HLFONT_SIZE(f)          [UIFont systemFontOfSize:(f)]
#define FONT_BOLD_SIZE(f)       [UIFont boldSystemFontOfSize:(f)]
#define FONT_ITALIC_SIZE(f)     [UIFont italicSystemFontOfSize:(f)]
#define HLWhiteColor            [UIColor whiteColor]
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define HLRandomColor           [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]
#define HLColorWithHex(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
#define ssRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ssRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
///=============================================================================

///=============================================================================
/// @name 判断数据是否为空
///=============================================================================
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
///=============================================================================

///=============================================================================
/// @name 系统相关
///=============================================================================
// app版本号
#define DEVICE_APP_VERSION      (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
// app Build版本号
#define DEVICE_APP_BUILD        (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 系统版本号（string）
#define DEVICE_OS_VERSION       [[UIDevice currentDevice] systemVersion]
// 系统版本号（float）
#define DEVICE_OS_VERSION_VALUE [DEVICE_OS_VERSION floatValue]
///=============================================================================

///=============================================================================
/// @name 屏幕坐标、尺寸相关
///=============================================================================
//判断是否iPhone X
#define IS_iPhoneX              ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 屏幕高度
#define HLScreenHeight           [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define HLScreenWidth            [[UIScreen mainScreen] bounds].size.width
// 状态栏高度
#define HLStatusBarHeight        (IS_iPhoneX ? 44.f : 20.f)
// 顶部导航栏高度
#define HLNavigationBarHeight    44.f
// 顶部安全距离
#define HLSafeAreaTopHeight      (IS_iPhoneX ? 88.f : 64.f)
// 底部安全距离
#define HLSafeAreaBottomHeight   (IS_iPhoneX ? 34.f : 0.f)
// Tabbar高度
#define HLTabbarHeight           49.f
// 去除上下导航栏剩余中间视图高度
#define HLContentHeight           (kScreenHeight - kSafeAreaTopHeight - kSafeAreaBottomHeight - kTabbarHeight)
///=============================================================================

///=============================================================================
/// @name Frame相关
///=============================================================================
// 控件尺寸比例
#define kScreenRate         (kScreenWidth/375.f)
// 实际尺寸
#define kSuitSize(size)      kScreenRate * (size)
/* 弧度转角度 */
#define SK_RADIANS_TO_DEGREES(radian) \
((radian) * (180.0 / M_PI))
/* 角度转弧度 */
#define SK_DEGREES_TO_RADIANS(angle) \
((angle) / 180.0 * M_PI)
///=============================================================================

///=============================================================================
/// @name Application
///=============================================================================
#define APPLICATION         [UIApplication sharedApplication]
#define APPDLE              (AppDelegate*)[APPLICATION delegate]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
//获取temp
#define kPathTemp           NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache          [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
///=============================================================================
/**快捷创建-通过alloc]init*/
#define HLObject(objectName) [[objectName alloc]init];
/**快捷转换字符串*/
#define conversionString(name) [NSString stringWithFormat:@"%@",name]
/**开启侧滑返回手势-包括后面的栈。*/
#define HLPopLastViewController self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;self.navigationController.interactivePopGestureRecognizer.enabled = YES;

#endif /* HLHeader_h */
