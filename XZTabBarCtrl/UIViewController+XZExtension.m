//
//  UIViewController+XZExtension.m
//  XZTabBarCtrlDemo
//
//  Created by yanqb on 2017/3/14.
//  Copyright © 2017年 kizy. All rights reserved.
//

#import "UIViewController+XZExtension.h"
#import "XZTabBarCtrl.h"
#import "ToolBarItem.h"

@implementation UIViewController (XZExtension)

- (void)setToolBarItem:(ToolBarItem *)toolBarItem{
    NSLog(@"呵呵哒~");
}

- (ToolBarItem *)toolBarItem{
    if (self.parentViewController && [self.parentViewController isKindOfClass:[XZTabBarCtrl class]]) {
        XZTabBarCtrl *vc = (XZTabBarCtrl *)self.parentViewController;
        
        NSUInteger index = [vc.childVCs indexOfObject:self];
        if (index != NSNotFound) {
            ToolBarItem *item = [vc.customToolBar.subviews objectAtIndex:index];
            return item;
        }
    }
    return nil;
}

- (void)setXzTabbarCtrl:(XZTabBarCtrl *)xzTabbarCtrl{
    NSLog(@"11");
}

- (XZTabBarCtrl *)xzTabbarCtrl{
    if (self.parentViewController && [self.parentViewController isKindOfClass:[XZTabBarCtrl class]]) {
        return (XZTabBarCtrl *)self.parentViewController;
    }
    return nil;
}

@end
