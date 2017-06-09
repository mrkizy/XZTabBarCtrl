//
//  ImgTextButton.h
//  JKHire
//
//  Created by fire on 16/10/11.
//  Copyright © 2016年 xianshijian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ToolBarItemType) {
    ToolBarItemType_default = 0,    //默认显示小红点和文字按钮
    ToolBarItemType_leftToRight = 1,    //左右图文按钮
    ToolBarItemType_topToBottom = 2,    //上下图文按钮
};

@interface ImgTextButton : UIButton

@property (nonatomic, assign) ToolBarItemType alignmentType;
@property (nonatomic, strong) UIView *budgeView;

@end
