//
//  RedViewCtrl.m
//  Demo
//
//  Created by 徐智 on 2017/6/9.
//  Copyright © 2017年 kizy. All rights reserved.
//

#import "RedViewCtrl.h"
#import "UIViewController+XZExtension.h"

@interface RedViewCtrl ()

@end

@implementation RedViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.toolBarItem.bageVal = @"6";
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
