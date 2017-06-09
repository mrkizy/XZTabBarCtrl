//
//  XZTabBarCtrl.m
//  JKHire
//
//  Created by kizy on 16/11/5.
//  Copyright © 2016年 kizy. All rights reserved.
//

#import "XZTabBarCtrl.h"
#import "ToolBarItem.h"

#define XZSCREEN_WIDTH     [[UIScreen mainScreen]bounds].size.width
#define XZSCREEN_HEIGHT    [[UIScreen mainScreen]bounds].size.height
#define XZSCREEN_SIZE      [UIScreen mainScreen].bounds.size
#define XZSCREEN_BOUNDS    [UIScreen mainScreen].bounds

@interface XZTabBarCtrl () <ToolBarItemDelegate>{
    BOOL _isFirst;  //修复第一个childVC，无法捕获navigation以及顶部空白问题（没渲染成功）
}

@property (nonatomic, strong) NSMutableArray *viewArr;

@end

@implementation XZTabBarCtrl

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _isFirst = YES;
    [self.view addSubview:self.customToolBar];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_isFirst) {
        _isFirst = NO;
        self.selectedIndex = 0;
    }
}

#pragma mark - 创建toolBar

/**
 *  创建toolBar
 */

- (UIView *)customToolBar{
    if (!_customToolBar) {
        [self createToolBar];
    }
    return _customToolBar;
}

- (void)createToolBar{
    if (!self.toolBarTitles.count) {
        NSLog(@"不创建toolBar");
        return;
    }
    
    NSAssert((self.childVCs.count), @"未给childVCs赋值");
    
    //判断是否存在UINavigationBar
    UIView *toolBar;
    if (!self.navigationController || self.navigationController.navigationBarHidden) {
        toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XZSCREEN_WIDTH, self.toolBarHeight)];
    }else{
        toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, 64, XZSCREEN_WIDTH, self.toolBarHeight)];
    }
    
    if (self.toolBarImages.count) {
        NSAssert(self.toolBarImages.count == self.toolBarTitles.count, @"toolBarImages数量错误");
    }
    
    toolBar.backgroundColor = [UIColor grayColor];
    _customToolBar = toolBar;
    _customToolBar.backgroundColor = self.xzToolBarColor;
    [self.view addSubview:toolBar];
    ToolBarItem *item = nil;
    for (NSInteger index = 0; index < self.toolBarTitles.count; index++) {
        item = [self createToolBarItem:self.toolBarTitles[index]];
        [item setItemTag:index];
        item.type = self.itemType;
        item.color = self.xzTitleColor;
        item.selectedColor = self.xzTitleSelectedColor;
        if (self.toolBarImages.count) {
            item.itemImage = [UIImage imageNamed:self.toolBarImages[index]];
        }
        [_customToolBar addSubview:item];
        [self layoutToolBarBtns];
    }
//    self.selectedIndex = 0;
}

- (ToolBarItem *)createToolBarItem:(NSString *)title{
    ToolBarItem *item = [[ToolBarItem alloc] init];
    item.itemTitle = title;
    item.color = self.xzTitleColor;
    item.selectedColor = self.xzTitleSelectedColor;
    item.delegate = self;
    return item;
}

/**
 *  对toolBar排序
 */

- (void)layoutToolBarBtns{
    NSArray *subViews = [_customToolBar subviews];
    CGFloat width = XZSCREEN_WIDTH / subViews.count;
    CGFloat height = _customToolBar.frame.size.height;
    for (NSInteger index = 0; index < subViews.count; index++) {
        UIView *view = [subViews objectAtIndex:index];
        view.frame = CGRectMake(width * index, 0, width, height);
    }
}

#pragma mark - ToolBarItemDelegate toolBar点击业务

- (void)toolBarItem:(ToolBarItem *)item selecedIndex:(NSInteger)selectedIndex{
    NSLog(@"超级赛亚人说：你的第%ld个item被点击了", selectedIndex);
    self.selectedIndex = selectedIndex;
}

/**
 *  重写selectedIndex点方法,同时赋予创建childVC的业务
 */
- (void)setSelectedIndex:(NSInteger)selectedIndex{
    if (![self isShowSelectedVCWith:selectedIndex]) {
        return;
    }
    _selectedIndex = selectedIndex;
    [self setSelectedBtnHightLight:selectedIndex];
    if (![self hasSelectedVCAtIndex:selectedIndex]){
        UIViewController *vc = [self.childVCs objectAtIndex:selectedIndex];
        [self.viewArr addObject:vc];
        [self addChildViewController:vc];
        [self.view addSubview:vc.view];
        vc.view.frame = CGRectMake(0, CGRectGetMaxY(self.customToolBar.frame), self.view.frame.size.width, self.view.frame.size.height - self.customToolBar.frame.size.height - self.customToolBar.frame.origin.y);
    }
    [self setChildVCShowAtIndex:selectedIndex];
    [self responseDelgateWith:selectedIndex];
}

//代理业务
- (BOOL)isShowSelectedVCWith:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(xzTabBarCtrl:shouldSelectViewController:)]) {
        if (index >= self.childVCs.count) {
            return NO;
        }
        
        UIViewController *selectedCtrl = [self.childVCs objectAtIndex:index];
        return [self.delegate xzTabBarCtrl:self shouldSelectViewController:selectedCtrl];
    }
    return YES;
}

- (void)responseDelgateWith:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(xzTabBarCtrl:selectedItem:)]) {
        ToolBarItem *item = [[self getToolItems] objectAtIndex:index];
        [self.delegate xzTabBarCtrl:self selectedItem:item];
    }
    
    if ([self.delegate respondsToSelector:@selector(xzTabBarCtrl:didSelectViewController:)]) {
        UIViewController *vc = [self.childVCs objectAtIndex:index];
        [self.delegate xzTabBarCtrl:self didSelectViewController:vc];
    }
}

//设置toolItem文字高亮颜色
- (void)setSelectedBtnHightLight:(NSInteger)selectedIndex{
    for (ToolBarItem *item in self.customToolBar.subviews) {
        item.selected = NO;
    }
    if (selectedIndex < self.customToolBar.subviews.count) {
        ToolBarItem *item = [self.customToolBar.subviews objectAtIndex:selectedIndex];
        item.selected = YES;
    }
}

//设置VC的显示
- (void)setChildVCShowAtIndex:(NSInteger)index{
    UIViewController *ctrl = [self.childVCs objectAtIndex:index];
    NSArray *views = [self getChildViews];
    [views enumerateObjectsUsingBlock:^(UIView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.hidden = YES;
        if (ctrl.view == obj) {
            obj.hidden = NO;
        }
        
    }];
}

//判断指定的Index是否选中
- (BOOL)hasSelectedVCAtIndex:(NSInteger)index{
    UIViewController *vc = [self.childVCs objectAtIndex:index];
    return !([self.childViewControllers indexOfObject:vc] == NSNotFound);
}

//乱七八糟方法
- (NSArray *)getChildViews{
    return [self.viewArr valueForKey:@"view"];
}

- (NSArray *)getToolItems{
    return [self.customToolBar subviews];
}


#pragma mark - 属性相关 重写 setter && getter

- (UIColor *)xzToolBarColor{
    if (!_xzToolBarColor) {
        _xzToolBarColor = [UIColor blackColor];
    }
    return _xzToolBarColor;
}

- (void)setxzToolBarColor:(UIColor *)xzToolBarColor{
    _xzToolBarColor = xzToolBarColor;
    if (_customToolBar) {
        _customToolBar.backgroundColor = xzToolBarColor;
    }
}

- (UIColor *)xzTitleColor{
    if (!_xzTitleColor) {
        _xzTitleColor = [UIColor grayColor];
    }
    return _xzTitleColor;
}

- (void)setxzTitleColor:(UIColor *)xzTitleColor{
    _xzTitleColor = xzTitleColor;
    if (_customToolBar && _customToolBar.subviews.count) {
        [_customToolBar.subviews enumerateObjectsUsingBlock:^(__kindof ToolBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.color = xzTitleColor;
        }];
    }
}

- (UIColor *)xzTitleSelectedColor{
    if (!_xzTitleSelectedColor) {
        _xzTitleSelectedColor = [UIColor whiteColor];
    }
    return _xzTitleSelectedColor;
}

- (void)setxzTitleSelectedColor:(UIColor *)xzTitleSelectedColor{
    _xzTitleSelectedColor = xzTitleSelectedColor;
    if (_customToolBar && _customToolBar.subviews.count) {
        [_customToolBar .subviews enumerateObjectsUsingBlock:^(__kindof ToolBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.selectedColor = xzTitleSelectedColor;
        }];
    }
}

- (NSMutableArray *)viewArr{
    if (!_viewArr) {
        _viewArr = [NSMutableArray array];
    }
    return _viewArr;
}

- (void)setToolBarTitles:(NSArray *)toolBarTitles{
    _toolBarTitles = toolBarTitles;
    if (_customToolBar) {
        
    }
}

- (NSMutableArray <__kindof UIViewController *>*)childVCs{
    if (!_childVCs) {
        _childVCs = [NSMutableArray array];
    }
    return _childVCs;
}

- (CGFloat)toolBarHeight{
    if (!_toolBarHeight) {
        _toolBarHeight = 49.0f;
    }
    return _toolBarHeight;
}

@end
