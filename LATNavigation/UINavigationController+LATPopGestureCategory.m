//
//  UINavigationController+LATPopGestureCategory.m
//  Git：https://github.com/KKLater/LATNavigation.git
//
//  Created by Later on 16/4/14.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "UINavigationController+LATPopGestureCategory.h"
#import <objc/runtime.h>
@interface UINavigationController ()<UIGestureRecognizerDelegate>
@end
@implementation UINavigationController (LATPopGestureCategory)
#pragma mark - Delegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    CGPoint beginningLocation = [gestureRecognizer locationInView:gestureRecognizer.view];
    CGFloat maxAllowedInitialDistance = self.maxAllowedInitialDistance;
    if (maxAllowedInitialDistance > 0 && beginningLocation.x > maxAllowedInitialDistance) {
        return NO;
    }
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    return YES;
}
#pragma mark - Setter/Getter
- (void)setFullScreenPopGesture:(BOOL)fullScreenPopGesture {
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:internalAction];
    panGesture.delegate = self;
    if (fullScreenPopGesture) {
        [self.view addGestureRecognizer:panGesture];
        panGesture.maximumNumberOfTouches = 1;
        self.interactivePopGestureRecognizer.enabled = NO;
    } else {
        self.interactivePopGestureRecognizer.enabled = YES;
        [self.view removeGestureRecognizer:panGesture];
    }
    objc_setAssociatedObject(self, @selector(fullScreenPopGesture), @(fullScreenPopGesture), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)fullScreenPopGesture {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (CGFloat)maxAllowedInitialDistance {
    CGFloat max = [objc_getAssociatedObject(self, _cmd) floatValue];
    if (max <= 0) {
        max = CGRectGetWidth([UIScreen mainScreen].bounds);
        objc_setAssociatedObject(self, _cmd, @(max), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    return max;
}
- (void)setMaxAllowedInitialDistance:(CGFloat)maxAllowedInitialDistance {
    if (maxAllowedInitialDistance <= 0) {
        return;
    }
    objc_setAssociatedObject(self, @selector(maxAllowedInitialDistance), @(maxAllowedInitialDistance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
