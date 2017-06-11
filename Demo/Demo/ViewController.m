//
//  ViewController.m
//  Demo
//
//  Created by 徐智 on 2017/6/9.
//  Copyright © 2017年 kizy. All rights reserved.
//

#import "ViewController.h"
//#import "XZTabBarCtrl.h"
#import "RedViewCtrl.h"
#import "OneViewCtrl.h"
#import "XZTabBar.h"

typedef void(^block)(id resul);

@interface ViewController ()

- (IBAction)btnOnClick:(id)sender;
- (IBAction)btnTopOnClick:(id)sender;
- (IBAction)btnBotOnCLick:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnOnClick:(id)sender {
    [self pushVCWithBlock:^(XZTabBarCtrl *tabBar) {
        tabBar.itemType = ToolBarItemType_default;
        tabBar.xzToolBarColor = [UIColor whiteColor];
        tabBar.xzTitleSelectedColor = [UIColor blueColor];
        tabBar.toolBarImages = @[@"job_push_icon_blue", @"job_push_icon_blue", @"job_push_icon_blue"];
        [self.navigationController pushViewController:tabBar animated:YES];
    }];
}

- (IBAction)btnTopOnClick:(id)sender {
    [self pushVCWithBlock:^(XZTabBarCtrl *tabBar) {
        tabBar.itemType = ToolBarItemType_topToBottom;
        tabBar.toolBarImages = @[@"job_msg_insurance", @"job_msg_post", @"job_msg_salary"];
        tabBar.toolBarHeight = 100.0f;
        [self.navigationController pushViewController:tabBar animated:YES];
    }];
}

- (IBAction)btnBotOnCLick:(id)sender {
    [self pushVCWithBlock:^(XZTabBarCtrl *tabBar) {
        tabBar.itemType = ToolBarItemType_leftToRight;
        tabBar.toolBarImages = @[@"job_push_icon_blue", @"job_push_icon_blue", @"job_push_icon_blue"];
        tabBar.xzToolBarColor = [UIColor whiteColor];
        tabBar.xzTitleSelectedColor = [UIColor blueColor];
        [self.navigationController pushViewController:tabBar animated:YES];
    }];
}

- (void)pushVCWithBlock:(block)block{
    XZTabBarCtrl *tabBar = [[XZTabBarCtrl alloc] init];
    
    UIViewController *ctrl1 = [[UIViewController alloc] init];
    ctrl1.view.backgroundColor = [UIColor whiteColor];
    
    OneViewCtrl *ctrl2 = [[OneViewCtrl alloc] init];
    ctrl2.view.backgroundColor = [UIColor blueColor];
    
    RedViewCtrl *ctrl3 = [[RedViewCtrl alloc] init];
    ctrl3.view.backgroundColor = [UIColor whiteColor];
    
    tabBar.childVCs = @[ctrl1, ctrl2, ctrl3];
    tabBar.toolBarTitles = @[@"第一个Item", @"第二个Item", @"第三个Item"];
    block(tabBar);
}

@end
