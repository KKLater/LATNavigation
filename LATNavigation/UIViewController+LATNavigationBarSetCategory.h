//
//  UIViewController+LATNavigationBarCategory.h
//  Git：https://github.com/KKLater/LATNavigation.git
//
//  Created by FB.Luo on 16/2/13.
//  Copyright © 2016年 FB.Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIViewController (LATNavigationBarSetCategory)
#pragma mark titleView
/**
 *  设置navigationBar的titleView
 *
 *  @param titleView navigationBar的titleView
 */
- (void)setNavigationBarTitleView:(UIView *)titleView;
/**
 *  设置navigationBar的titleView为图片
 *
 *  @param titleViewImage titleView的图片
 */
- (void)setNavigationBarImageTitleViewWithImage:(UIImage *)titleViewImage;
#pragma mark background
/**
 *  设置navigationBar的背景图片
 *
 *  @param backgroundImageName 背景图片
 */
- (void)setNavigationBarBackgroundImage:(UIImage *)backgroundImage;
#pragma mark tintColor
/**
 *  设置左Item、右Item的显示的TintColor
 *
 *  @param leftTintColor  左Item的TintColor
 *  @param rightTintColor 右Item的TintColor
 */
- (void)setNavigationLeftBarTintColor:(UIColor*)leftTintColor rightBarTintColor:(UIColor*)rightTintColor;
#pragma mark more ItemImages
/**
 *  @author Later, 16-04-17 14:04
 *
 *  设置右侧多个item对象
 *
 *  @param elements   右侧多个对象元素，<Title:NSString,Image:UIImage>
 *  @param indexBlock item元素位置
 */
- (void)setNavigationBarRightBarButtonsWithElements:(NSArray *)elements rightBarButtonClickedBlock:(void(^)(NSInteger barButtonIndex))indexBlock;
/**
 *  @author Later, 16-04-17 14:04
 *
 *  设置左侧多个item对象
 *
 *  @param elements   左侧多个对象元素，<Title:NSString,Image:UIImage>
 *  @param indexBlock item元素位置
 */
- (void)setNavigationBarLeftBarButtonsWithElements:(NSArray *)elements leftBarButtonClickedBlock:(void(^)(NSInteger barButtonIndex))indexBlock;
@end
