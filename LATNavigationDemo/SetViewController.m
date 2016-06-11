
//
//  SetViewController.m
//  LATNavigationDemo
//
//  Created by Later on 16/6/11.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationItems];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"设置";
}
- (void)setNavigationItems {
    __weak typeof(self)weakSelf = self;
    [self setNavigationBarLeftBarButtonsWithElements:@[[UIImage imageNamed:@"back@3x.png"]] leftBarButtonClickedBlock:^(NSInteger barButtonIndex) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self setNavigationLeftBarTintColor:[UIColor colorWithRed:0.8 green:0 blue:0 alpha:1] rightBarTintColor:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
