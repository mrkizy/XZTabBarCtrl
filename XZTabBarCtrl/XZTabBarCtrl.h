//
//  XZTabBarCtrl.h
//  JKHire
//
//  Created by kizy on 16/11/5.
//  Copyright © 2016年 kizy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolBarItem.h"

@class XZTabBarCtrl;
@protocol XZTabBarCtrlDelegate <NSObject>

- (void)xzTabBarCtrl:(XZTabBarCtrl *)tabbarCtrl selectedItem:(ToolBarItem *)toolBarItem;
- (BOOL)xzTabBarCtrl:(XZTabBarCtrl *)tabbarCtrl shouldSelectViewController:(UIViewController *)viewController;
- (void)xzTabBarCtrl:(XZTabBarCtrl *)tabbarCtrl didSelectViewController:(UIViewController *)viewController;

@end

@interface XZTabBarCtrl : UIViewController

@property (nonatomic, weak) id<XZTabBarCtrlDelegate> delegate;


/**
 *  @decription toolBarItem's title: 存放自定义tooleBar的标题数组
 *  @warning    该属性可为空，为空表示不创建tooleBar
 */

@property (nonatomic, copy) NSArray *toolBarTitles;

/**
 *  @decription toolBarItem's image: 存放自定义tooleBar的图片数组
 *  @warning    该属性可为空，如需赋值，count大小需与toolBarTitles一致
 */

@property (nonatomic, copy) NSArray *toolBarImages;

/**
 *  @decription toolBar's height: 设置toolBar的高度，默认高度为49.0f
 */

@property (nonatomic, assign) CGFloat toolBarHeight;

/**
 *  @decription 自定义的toolBar
 *  @warning    toolBar整个机制类似UITabBarController的tabBar：一个XZTabBarCtrl只有一个customeToolBar；每个子控制器拥有独立的ToolBarItem，可支持小红点、标题更改 etc, 子控制器获取该tooleBarItem需要引用文件
 */

@property (nonatomic, weak) UIView *customToolBar;

/**
 *  @decription toolBarItem显示样式
    ToolBarItemType_default,    //默认显示系统正常排列按钮
    ToolBarItemType_normalImgText,    //左右图文按钮
    ToolBarItemType_unnormalImgText,    //上下图文按钮
 */
@property (nonatomic, assign) ToolBarItemType itemType;

/**
 *  @decription  控制toolBar的背景颜色，default is blackColor
 */

@property (nonatomic, strong) UIColor *xzToolBarColor;

/**
 *  @decription  控制toolItem的文字正常显示颜色，default is grayColor
 */

@property (nonatomic, strong) UIColor *xzTitleColor;


/**
 *  @decription  控制被选中toolItem的文字显示颜色，default is whiteColor
 */

@property (nonatomic, strong) UIColor *xzTitleSelectedColor;

/**
 *  @decription 存放子控制器的数组
 *  @warning    该属性不能为空，必须赋值
 */

@property (nonatomic, copy) NSMutableArray<__kindof UIViewController *> *childVCs;

/**
 *  @decription  当前显示的控制器的Index
 *  @warning    该属性用法类似UITabBarController的selectedIndex属性
 */

@property (nonatomic, assign) NSInteger selectedIndex;

/**
 *  @decription  该属性是子控制器的扩展，是XZTabBarCtrl
 *  @warning    该属性用法类似UITabBarController的TabbarController用法
 */

@property (nonatomic, strong) UIViewController *rootViewCtrl;

@end
