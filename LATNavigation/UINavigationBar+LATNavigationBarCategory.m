//
//  UINavigationBar+LATNavigationBarCategory.m
//  LATNavigationDemo
//
//  Created by Later on 16/5/7.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "UINavigationBar+LATNavigationBarCategory.h"
#import <objc/runtime.h>
@implementation UINavigationBar (LATNavigationBarCategory)
@dynamic navigationBarStyle;
- (void)setNavigationBarStyle:(LATNavigationBarStyle)navigationBarStyle {
    switch (navigationBarStyle) {
        case LATNavigationBarStyleDefault:
        {
            [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![NSStringFromClass([obj class]) isEqualToString:@"_UINavigationBarBackIndicatorView"]) {
                    obj.alpha = 1;
                }
            }];
            break;
        }
        case LATNavigationBarStyleOnlyItem:
        {
            [self _lat_setNavigationBarBackgroundAlpla:0];
            break;
        }
    }
    objc_setAssociatedObject(self, @selector(navigationBarStyle), @(navigationBarStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (LATNavigationBarStyle)navigationBarStyle {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}
- (void)setBarAlpha:(CGFloat)barAlpha {
    switch (self.navigationBarStyle) {
        case LATNavigationBarStyleDefault:
        {
            self.alpha = barAlpha;
            break;
        }
        case LATNavigationBarStyleOnlyItem:
        {
            [self _lat_setNavigationBarBackgroundAlpla:barAlpha];
            break;
        }
    }
    objc_setAssociatedObject(self, @selector(barAlpha), @(barAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)barAlpha {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)_lat_setNavigationBarBackgroundAlpla:(CGFloat)alpha {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            obj.alpha = alpha;
        }
    }];

}
@end
