//
//  ViewController.m
//  LATNavigationDemo
//
//  Created by Later on 16/6/11.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "ViewController.h"
#import "MineViewController.h"
#import "SetViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNavigationItems];
    [self.view addSubview:self.tableView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //视图将要显示时，设置navigationBarStyle及barAlpha
    self.navigationController.navigationBar.navigationBarStyle = LATNavigationBarStyleOnlyItem;
    self.navigationController.navigationBar.barAlpha = 0;
    
    self.tableView.frame = self.view.frame;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds),CGRectGetWidth(self.tableView.bounds)/3*2.f)];
    imageView.image = [UIImage imageNamed:@"IMG_0230.GIF"];
    self.tableView.tableHeaderView = imageView;
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //改变视图的navigationBarStyle
    self.navigationController.navigationBar.navigationBarStyle = LATNavigationBarStyleDefault;
}
- (void)setNavigationItems {
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
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //动态设置navigationBar的barAlpha值
    CGFloat height = CGRectGetWidth(self.tableView.bounds)/3*2.f - 64;
    [UIView animateWithDuration:0.3 animations:^{
        if(self.tableView.contentOffset.y<=height) {
            if (self.navigationController.navigationBar.barAlpha != 0) {
                self.navigationController.navigationBar.barAlpha = 0;
            }
        } else {
            if (self.navigationController.navigationBar.barAlpha != 1) {
                self.navigationController.navigationBar.barAlpha = 1;
            }
        }
    }];
    
    
}
#pragma mark getter/setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
    }
    return _tableView;
}
@end
