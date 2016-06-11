# LATNavigation

* 一个与UINavigationController、UINavigationBar等Navigation相关的封装。

### 演示

 ![LATNavigation](/Users/Later/Desktop/LATNavigation.gif)

### 功能

#### 1、【UINavigationBar+LATNavigationBarCategory】

​	一组与navigationBar的设置相关项。

* 设置navigationBar的类型：

  ```objective-c
  //设置navigationBar的类型
  @property (nonatomic, assign) LATNavigationBarStyle navigationBarStyle;
  //默认类型：系统默认显示
  LATNavigationBarStyleDefault;
  //只显示items
  LATNavigationBarStyleOnlyItem;
  ```

* 设置navigationBar的barAlpha值

  ```objective-c
  /* 设置navigationBar的alpha值，根据navigationBarStyle的类型不同，alpha设置不同。
  	默认类型时：直接设置navigationBar的系统的alpha值
  	OnlyItem时：设置background的alpha值，不改变任何items的alpha。
  */
  @property (assign, nonatomic) CGFloat barAlpha;
  ```

#### 2、【UINavigationController+LATPopGestureCategory】

​	一组与navigationController的全屏侧滑返回有关的属性。

* 设置navigationController是否支持全屏侧滑返回

  ```objective-c
  //设置属性为YES时，navigationController支持全屏侧滑返回，否则，不支持全屏侧滑返回
  //默认：NO
  @property (nonatomic, assign) BOOL fullScreenPopGesture;
  ```

* 设置navigationController的滑动范围（0~screen.width）

  ```objective-c
  //设置navigationController支持全屏侧滑返回时的侧滑返回响应范围，默认是全屏：[UIScreen mainScreen].bounds.width。可设置任意(0 ~ [UIScreen mainScreen].bounds.width)的范围。
  @property (nonatomic, assign) CGFloat maxAllowedInitialDistance;
  ```

#### 3、【UIViewController+LATNavigationBarCategory】

​	一组与navigationBar的部分相关设置有关的快速代码整合。主要包含了titleView、background、tintColor、items相关的快速方法。

* 设置与navigationBar的titleView有关项

  ```objective-c
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
  ```

* 设置与navigationBar的background相关项

  ```objective-c
  #pragma mark background
  /**
   *  设置navigationBar的背景图片
   *
   *  @param backgroundImageName 背景图片
   */
  - (void)setNavigationBarBackgroundImage:(UIImage *)backgroundImage;
  ```

* 设置与tintColor相关项

  ```objective-c
  /**
   *  设置左Item、右Item的显示的TintColor
   *
   *  @param leftTintColor  左Item的TintColor
   *  @param rightTintColor 右Item的TintColor
   */
  - (void)setNavigationLeftBarTintColor:(UIColor*)leftTintColor rightBarTintColor:(UIColor*)rightTintColor;
  ```

* 设置与items相关

  ```objective-c
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
  ```

### 【使用】

* 直接将`LATNavigation.h`引入到项目中使用。

### 【代码示例】

* 对navigationController设置全屏侧滑返回相关

  ```objective-c
  //设置navigationController支持全屏侧滑返回
  navigationController.fullScreenPopGesture = YES;
  //设置navigationController的全屏侧滑返回的触发范围
  navigationController.maxAllowedInitialDistance = CGRectGetWidth([UIScreen mainScreen].bounds)/2.f;
  ```

* 对navigationBar设置style和barAlpha

  ```objective-c
  //视图将要显示时，设置navigationBarStyle及barAlpha
  self.navigationController.navigationBar.navigationBarStyle = LATNavigationBarStyleOnlyItem;
  self.navigationController.navigationBar.barAlpha = 0;
  ```

* 对navigationBar设置其他项

  ```objective-c
  __weak typeof(self)weakSelf = self;
  //设置navigationController的leftBarButtonItem、rightBarButtonItem及其点击触发
  [self setNavigationBarLeftBarButtonsWithElements:@[[UIImage imageNamed:@"mine@3x.png"]] leftBarButtonClickedBlock:^(NSInteger barButtonIndex) {
      MineViewController *mine = [[MineViewController alloc] init];
      [weakSelf.navigationController pushViewController:mine animated:YES];
  }];
  [self setNavigationBarRightBarButtonsWithElements:@[[UIImage imageNamed:@"set@3x.png"]] rightBarButtonClickedBlock:^(NSInteger barButtonIndex) {
      SetViewController *set = [SetViewController new];
      [weakSelf.navigationController pushViewController:set animated:YES];
  }];
  //设置navigation的tintColor
  [self setNavigationLeftBarTintColor:[UIColor colorWithRed:0.8 green:0 blue:0 alpha:1] rightBarTintColor:[UIColor colorWithRed:0.8 green:0 blue:0 alpha:1]];
  ```



### 【期望】

* 还不够全面，缺少很多与navigation相关的设置封装，后期逐步添加。
* 接口不够简练，后期需要简练接口。



### 【联系方式】

如有疑问，欢迎联系Later：lshxin89@126.com。共同学习交流。

