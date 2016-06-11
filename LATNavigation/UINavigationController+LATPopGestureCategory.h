//
//  UINavigationController+LATPopGestureCategory.h
//  Git：https://github.com/KKLater/LATNavigation.git
//
//  Created by Later on 16/4/14.
//  Copyright © 2016年 Later. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (LATPopGestureCategory)
/**
 *  @author Later, 16-04-23 19:04
 *
 *  滑动返回手势
 */
@property (nonatomic, assign) BOOL fullScreenPopGesture;
/**
 *  @author Later, 16-04-23 19:04
 *
 *  滑动手势触发范围
 */
@property (nonatomic, assign) CGFloat maxAllowedInitialDistance;
@end
