//
//  UIButton+ButtonExtension.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "UIButton+ButtonExtension.h"

@implementation UIButton (ButtonExtension)

+ (UIButton *)ButtonWithTitle:(NSString *)title
                           bgColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                          fontSize:(CGFloat)fontSize

{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = bgColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return btn;
}
@end
