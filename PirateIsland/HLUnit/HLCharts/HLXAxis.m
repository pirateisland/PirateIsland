//
//  HLXAxis.m
//  bingrui-ios
//
//  Created by huaxingyunrui on 2019/3/13.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "HLXAxis.h"

@implementation HLXAxis
AAPropSetFuncImplementation(HLXAxis, NSNumber *, tickWidth) //坐标轴刻度线的宽度，设置为 0 时则不显示刻度线
AAPropSetFuncImplementation(HLXAxis, NSNumber *, tickLength)//坐标轴刻度线的长度。 默认是：10.
AAPropSetFuncImplementation(HLXAxis, NSString *, tickPosition) //刻度线相对于轴线的位置，可用的值有 inside 和 outside，分别表示在轴线的内部和外部。 默认是：outside.
//AAPropSetFuncImplementation(HLXAxis, NSString *, tickColor) //坐标轴刻度线的颜色。在 CSS 样式模式 中，刻度线的样式是由 CSS 样式类.highcharts-tick 来控制的。默认是：#ccd6eb.
@end
