//
//  UIViewController+LATNavigationBarCategory.m
//  LATNavigationDemo
//
//  Created by Later on 16/2/13.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "UIViewController+LATNavigationBarSetCategory.h"
#import <objc/runtime.h>
#pragma mark typedef block
typedef void (^navigationBarButtonClickedBlock)(NSInteger buttonIndex);
@interface UIViewController ()
@property (nonatomic, strong) UIColor *leftBarButtonItemTincColor;
@property (nonatomic, strong) UIColor *rightBarButtonItemTincColor;
@end
@implementation UIViewController (LATNavigationBarSetCategory)
#pragma mark titleView
- (void)setNavigationBarTitleView:(UIView *)titleView{
    self.title = nil;
    self.navigationItem.titleView = titleView;
}
- (void)setNavigationBarImageTitleViewWithImage:(UIImage *)titleViewImage{
    [self setNavigationBarTitleView:[[UIImageView alloc] initWithImage:titleViewImage]];
}
#pragma mark background
- (void)setNavigationBarBackgroundImage:(UIImage *)backgroundImage{
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
}
#pragma mark tintColor
- (void)setNavigationLeftBarTintColor:(UIColor*)leftTintColor rightBarTintColor:(UIColor*)rightTintColor {
    if (leftTintColor) {
        self.leftBarButtonItemTincColor = leftTintColor;
        self.navigationItem.leftBarButtonItem.tintColor = leftTintColor;
    }
    if (rightTintColor) {
        self.rightBarButtonItemTincColor = rightTintColor;
        self.navigationItem.rightBarButtonItem.tintColor = rightTintColor;
    }
}
#pragma mark more Items
- (void)setNavigationBarRightBarButtonsWithElements:(NSArray *)elements rightBarButtonClickedBlock:(void(^)(NSInteger barButtonIndex))indexBlock {
    if (elements.count == 0) return;
    self.rightBarButtonIndexBlock = indexBlock;
    NSMutableArray * rightBarButtonItems = [NSMutableArray new];
    for (NSInteger i = 0; i < elements.count; i ++) {
        UIBarButtonItem* rightBarButton;
        if ([elements[i] isKindOfClass:[NSString class]]) {
            rightBarButton = [[UIBarButtonItem alloc] initWithTitle:elements[i] style:UIBarButtonItemStyleDone target:self action:@selector(_lat_rightBarButtonItemClicked:)];
        } else if ([elements[i] isKindOfClass:[UIImage class]]) {
            rightBarButton =
            [[UIBarButtonItem alloc] initWithImage:elements[i] style:UIBarButtonItemStyleDone target:self action:@selector(_lat_rightBarButtonItemClicked:)];
        } else {
            NSLog(@"你传入的navigationBarItem元素不是title或者不是图片类型");
        }
        rightBarButton.tag = i;
        rightBarButton.tintColor = self.rightBarButtonItemTincColor;
        [rightBarButtonItems addObject:rightBarButton];
    }
    self.navigationItem.rightBarButtonItems = rightBarButtonItems;
    
}
- (void)setNavigationBarLeftBarButtonsWithElements:(NSArray *)elements leftBarButtonClickedBlock:(void(^)(NSInteger barButtonIndex))indexBlock {
    if (elements.count == 0) return;
    self.leftBarButtonIndexBlock = indexBlock;
    NSMutableArray * leftBarButtonItems = [NSMutableArray new];
    for (NSInteger i = 0; i < elements.count; i ++) {
        UIBarButtonItem* leftBarButton;
        if ([elements[i] isKindOfClass:[NSString class]]) {
            leftBarButton = [[UIBarButtonItem alloc] initWithTitle:elements[i] style:UIBarButtonItemStyleDone target:self action:@selector(_lat_leftBarButtonItemClicked:)];
        } else if ([elements[i] isKindOfClass:[UIImage class]]) {
            leftBarButton =
            [[UIBarButtonItem alloc] initWithImage:elements[i] style:UIBarButtonItemStyleDone target:self action:@selector(_lat_leftBarButtonItemClicked:)];
        } else {
            NSLog(@"你传入的navigationBarItem元素不是title或者不是图片类型");
        }
        
        leftBarButton.tag = i;
        leftBarButton.tintColor = self.leftBarButtonItemTincColor;
        [leftBarButtonItems addObject:leftBarButton];
    }
    self.navigationItem.leftBarButtonItems = leftBarButtonItems;
}
#pragma mark privateMethod
#pragma mark clicked
- (void)_lat_leftBarButtonItemClicked:(UIBarButtonItem *)barButtonItem {
    if ([barButtonItem isKindOfClass:[UIBarButtonItem class]]) {
        !self.leftBarButtonIndexBlock ?: self.leftBarButtonIndexBlock((int) ((UIBarButtonItem *)barButtonItem).tag);
    }
}
- (void)_lat_rightBarButtonItemClicked:(id)barButtonItem {
    if ([barButtonItem isKindOfClass:[UIBarButtonItem class]]) {
        !self.rightBarButtonIndexBlock ?: self.rightBarButtonIndexBlock((int) ((UIBarButtonItem *)barButtonItem).tag);
    }
    
}
#pragma mark setter/getter
- (void)setLeftBarButtonIndexBlock:(navigationBarButtonClickedBlock)leftBarButtonIndexBlock{
    objc_setAssociatedObject(self, @selector(leftBarButtonIndexBlock), leftBarButtonIndexBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (navigationBarButtonClickedBlock)leftBarButtonIndexBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightBarButtonIndexBlock:(navigationBarButtonClickedBlock)rightBarButtonIndexBlock{
    objc_setAssociatedObject(self, @selector(rightBarButtonIndexBlock), rightBarButtonIndexBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (navigationBarButtonClickedBlock)rightBarButtonIndexBlock{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setLeftBarButtonItemTincColor:(UIColor *)leftBarButtonItemTincColor {
    objc_setAssociatedObject(self, @selector(leftBarButtonItemTincColor), leftBarButtonItemTincColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)leftBarButtonItemTincColor {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setRightBarButtonItemTincColor:(UIColor *)rightBarButtonItemTincColor {
    objc_setAssociatedObject(self, @selector(rightBarButtonItemTincColor), rightBarButtonItemTincColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)rightBarButtonItemTincColor {
    return objc_getAssociatedObject(self, _cmd);
}
@end
