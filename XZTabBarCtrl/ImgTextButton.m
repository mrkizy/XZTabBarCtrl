//
//  ImgTextButton.m
//  JKHire
//
//  Created by fire on 16/10/11.
//  Copyright © 2016年 xianshijian. All rights reserved.
//

#import "ImgTextButton.h"

@implementation ImgTextButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)budgeView{
    if (!_budgeView) {
        _budgeView = [[UIView alloc] init];
        [_budgeView.layer setCornerRadius:5.0f];
        [_budgeView.layer setMasksToBounds:YES];
        _budgeView.backgroundColor = [UIColor redColor];
        _budgeView.hidden = YES;
        [self addSubview:_budgeView];
    }
    return _budgeView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    switch (self.alignmentType) {
        case ToolBarItemType_topToBottom:{
            [self setWidth:self.frame.size.width toView:self.titleLabel];

            [self setWidth:46.0f toView:self.imageView];
            [self setHeight:46.0f toView:self.imageView];
            
            CGFloat margin = (self.frame.size.height - self.imageView.frame.size.height - self.titleLabel.frame.size.height) / 2;
            [self setCenterX:self.frame.size.width / 2 toView:self.imageView];
            [self setY:margin - 5 toView:self.imageView];

//            self.titleLabel.centerX = self.width / 2;
            [self setCenterX:self.frame.size.width / 2 toView:self.titleLabel];
            [self setCenterY:CGRectGetMaxY(self.imageView.frame) + 5 toView:self.titleLabel];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            if (_budgeView) {
                _budgeView.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 2, self.imageView.frame.origin.y, 10, 10);
            }
        }
            break;
        case ToolBarItemType_default:{
            if (_budgeView) {
                _budgeView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame) + 2, self.titleLabel.frame.origin.y, 10, 10);
            }
        }
            break;
        case ToolBarItemType_leftToRight:{
            CGFloat margin = (self.frame.size.width - self.imageView.frame.size.width - self.titleLabel.frame.size.width) / 2;
            [self setX:margin toView:self.titleLabel];
            [self setX:self.titleLabel.frame.size.width + margin + 2 toView:self.imageView];
            if (_budgeView) {
                _budgeView.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 2, self.imageView.frame.origin.y, 10, 10);
            }
        }
            break;
        default:
            break;
    }
}

- (void)setCenterX:(CGFloat)x toView:(UIView *)view{
    CGPoint center = view.center;
    center.x = x;
    view.center = center;
}

- (void)setCenterY:(CGFloat)y toView:(UIView *)view{
    CGPoint center = view.center;
    center.y = y;
    view.center = center;
}

- (void)setX:(CGFloat)x toView:(UIView *)view{
    CGRect rect = view.frame;
    rect.origin.x = x;
    view.frame = rect;
}

- (void)setY:(CGFloat)y toView:(UIView *)view{
    CGRect rect = view.frame;
    rect.origin.y = y;
    view.frame = rect;
}

- (void)setWidth:(CGFloat)width toView:(UIView *)view{
    CGRect rect = view.frame;
    rect.size.width = width;
    view.frame = rect;
}

- (void)setHeight:(CGFloat)height toView:(UIView *)view{
    CGRect rect = view.frame;
    rect.size.height = height;
    view.frame = rect;
}

@end
