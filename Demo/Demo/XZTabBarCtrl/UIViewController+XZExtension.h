//
//  UIViewController+XZExtension.h
//  XZTabBarCtrlDemo
//
//  Created by yanqb on 2017/3/14.
//  Copyright © 2017年 kizy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolBarItem.h"
#import "XZTabBarCtrl.h"

@interface UIViewController (XZExtension)

@property (nonatomic, weak) ToolBarItem *toolBarItem;
@property (nonatomic, weak) XZTabBarCtrl *xzTabbarCtrl;

@end
