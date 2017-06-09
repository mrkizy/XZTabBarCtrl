//
//  ToolBarItem.m
//  jianke
//
//  Created by yanqb on 2016/11/15.
//  Copyright © 2016年 xianshijian. All rights reserved.
//

#import "ToolBarItem.h"
#import "ImgTextButton.h"

@interface ToolBarItem ()

@property (nonatomic, strong) ImgTextButton *button;
@property (nonatomic, strong) UILabel *labBageVal;


@end

@implementation ToolBarItem

- (void)setButtonTag:(NSInteger)tag{
    self.button.tag = tag;
}

- (void)setItemTitle:(NSString *)itemTitle{
    _itemTitle = itemTitle;
    [self.button setTitle:itemTitle forState:UIControlStateNormal];
}

- (void)setItemImage:(UIImage *)itemImage{
    _itemImage = itemImage;
    [self.button setImage:itemImage forState:UIControlStateNormal];
}

- (void)setItemTag:(NSInteger)tag{
    self.tag = tag;
    self.button.tag = tag;
}

- (void)setColor:(UIColor *)color{
    _color = color;
    [self.button setTitleColor:color forState:UIControlStateNormal];
}

- (void)setSelectedColor:(UIColor *)selectedColor{
    _selectedColor = selectedColor;
    [self.button setTitleColor:selectedColor forState:UIControlStateSelected];
}

- (void)setType:(ToolBarItemType)type{
    _type = type;
    self.button.alignmentType = type;
}

- (ImgTextButton *)button{
    if (!_button) {
        _button = [ImgTextButton buttonWithType:UIButtonTypeCustom];
        _button.alignmentType = self.type;
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_button addTarget:self action:@selector(toolBarBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
//        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self);
//        }];
    }
    return _button;
}

- (UIView *)budgeView{
//    if (!_budgeView) {
//        _budgeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//        [_budgeView.layer setCornerRadius:5.0f];
//        [_budgeView.layer setMasksToBounds:YES];
//        _budgeView.backgroundColor = [UIColor redColor];
//        _budgeView.hidden = YES;
//        [self addSubview:_budgeView];
//    }
//    return _budgeView;
    return self.button.budgeView;

}

- (void)toolBarBtnOnClick:(UIButton *)sender{
    self.selected = !self.selected;
    if ([self.delegate respondsToSelector:@selector(toolBarItem:selecedIndex:)]) {
        [self.delegate toolBarItem:self selecedIndex:sender.tag];
    }
}

- (void)setSelected:(BOOL)selected{
    _selected = selected;
    self.button.selected = selected;
}

- (void)setTitleSize:(CGFloat)titleSize{
    _titleSize = titleSize;
    [self.button.titleLabel setFont:[UIFont systemFontOfSize:titleSize]];
}

- (void)setBageVal:(NSString *)bageVal{
    _bageVal = bageVal;
    if (!bageVal.length || bageVal.integerValue == 0) {
        self.labBageVal.hidden = YES;
    }else{
        self.labBageVal.hidden = NO;
        NSString *bageStr = nil;
        if (bageVal.length > 1) {
            bageStr = [NSString stringWithFormat:@" %ld ", bageVal.integerValue];
        }else{
            bageStr = [NSString stringWithFormat:@"%ld", bageVal.integerValue];
        }
        self.labBageVal.text = bageStr;
    }
}

- (UILabel *)labBageVal{
    if (!_labBageVal) {
//        _labBageVal = [UILabel labelWithText:@"0" textColor:[UIColor whiteColor] fontSize:12.0f];
        _labBageVal = [[UILabel alloc] init];
        _labBageVal.textColor = [UIColor whiteColor];
        _labBageVal.font = [UIFont systemFontOfSize:12.0f];
        [_labBageVal setTextAlignment:NSTextAlignmentCenter];
        [_labBageVal.layer setCornerRadius:8.0f];
        [_labBageVal.layer setMasksToBounds:YES];
        [_labBageVal setBackgroundColor:[UIColor redColor]];
        _labBageVal.hidden = YES;
        [self addSubview:_labBageVal];
    }
    return _labBageVal;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_button) {
        _button.frame = self.bounds;
    }
//    if (_budgeView) {
//        switch (self.type) {
//            case ToolBarItemType_default:{
//                _budgeView.frame = CGRectMake(CGRectGetMaxX(_button.titleLabel.frame), _button.titleLabel.frame.origin.y - 5, 10, 10);
//            }
//                break;
//            case ToolBarItemType_leftToRight:{
//                _budgeView.frame = CGRectMake(CGRectGetMaxX(_button.imageView.frame), _button.imageView.frame.origin.y - 5, 10, 10);
//            }
//                break;
//            case ToolBarItemType_topToBottom:{
//                _budgeView.frame = CGRectMake(CGRectGetMaxX(_button.imageView.frame), _button.titleLabel.frame.origin.y - 5, 10, 10);
//            }
//                break;
//            default:
//                break;
//        }
//        
//    }
    if (_labBageVal) {
        CGSize size = [_labBageVal sizeThatFits:CGSizeMake(100, 16)];
        CGFloat width = size.width < 16 ? 16 : size.width;
        CGFloat height = size.height < 16 ? 16 : size.height;
        switch (self.type) {
            case ToolBarItemType_default:{
                _labBageVal.frame = CGRectMake(CGRectGetMaxX(_button.titleLabel.frame), _button.titleLabel.frame.origin.y - 5, width, height);
            }
                break;
            case ToolBarItemType_leftToRight:{
                _labBageVal.frame = CGRectMake(CGRectGetMaxX(_button.imageView.frame), _button.imageView.frame.origin.y - 5, width, height);
            }
                break;
            case ToolBarItemType_topToBottom:{
                _labBageVal.frame = CGRectMake(CGRectGetMaxX(_button.imageView.frame), _button.imageView.frame.origin.y - 5, width, height);
            }
                break;
            default:
                break;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
