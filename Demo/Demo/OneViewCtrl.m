//
//  OneViewCtrl.m
//  Demo
//
//  Created by 徐智 on 2017/6/9.
//  Copyright © 2017年 kizy. All rights reserved.
//

#import "OneViewCtrl.h"
#import "UIViewController+XZExtension.h"

@interface OneViewCtrl ()

@end

@implementation OneViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"显示小红点" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(150, 100, 100, 30);
    [self.view addSubview:button];
}

- (void)btnOnClick:(UIButton *)sender{
    self.toolBarItem.budgeView.hidden = NO;
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
