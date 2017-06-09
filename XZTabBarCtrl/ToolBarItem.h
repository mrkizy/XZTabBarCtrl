//
//  ToolBarItem.h
//  jianke
//
//  Created by yanqb on 2016/11/15.
//  Copyright © 2016年 xianshijian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgTextButton.h"
#define XZRedPointTag 200

@class ToolBarItem;
@protocol ToolBarItemDelegate <NSObject>

- (void)toolBarItem:(ToolBarItem *)item selecedIndex:(NSInteger)selectedIndex;

@end

@interface ToolBarItem : UIView

@property (nonatomic, weak) id<ToolBarItemDelegate> delegate;

/** toolBarItem显示类型：3种 必须在以下属性赋值之前赋值才有效 */
@property (nonatomic, assign) ToolBarItemType type;

/** 小红点 */
@property (nonatomic, strong) UIView *budgeView;

/** toolBarItem的显示文字 */
@property (nonatomic, copy) NSString *itemTitle;

/** toolBarItem的显示图片 */
@property (nonatomic, strong) UIImage *itemImage;

/** toolBarItem的显示文字颜色 */
@property (nonatomic, strong) UIColor *color;

/** toolBarItem的显示文字选中颜色 */
@property (nonatomic, strong) UIColor *selectedColor;

/** toolBarItem的显示文字大小 */
@property (nonatomic, assign) CGFloat titleSize;

/** selected状态 */
@property (nonatomic, assign) BOOL selected;

/** bageVal */
@property (nonatomic, copy) NSString *bageVal;

/** toolBarItem的唯一标签 */
- (void)setItemTag:(NSInteger)tag;

@end
