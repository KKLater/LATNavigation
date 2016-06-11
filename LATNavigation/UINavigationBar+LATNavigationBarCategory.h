//
//  UINavigationBar+LATNavigationBarCategory.h
//  Git：https://github.com/KKLater/LATNavigation.git
//
//  Created by Later on 16/5/7.
//  Copyright © 2016年 Later. All rights reserved.
//

#import <UIKit/UIKit.h>
/** NavigationBar类型 */
typedef NS_ENUM(NSInteger, LATNavigationBarStyle) {
    LATNavigationBarStyleDefault,   /** Default */
    LATNavigationBarStyleOnlyItem   /** OnlyItem */
};
@interface UINavigationBar (LATNavigationBarCategory)
/**
 *  @author Later, 16-04-23 19:04
 *
 *  设置NavigationBarStyle
 *  默认
 *  只显示item
 */
@property (nonatomic, assign) LATNavigationBarStyle navigationBarStyle;
/**
 *  @author Later, 16-06-11 12:06
 *
 *  设置navigationBar的alpha值（区别于navigationBarStyle）
 */
@property (assign, nonatomic) CGFloat barAlpha;
@end
