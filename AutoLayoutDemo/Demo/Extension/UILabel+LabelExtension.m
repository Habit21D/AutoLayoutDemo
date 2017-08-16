//
//  UILabel+LabelExtension.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "UILabel+LabelExtension.h"

@implementation UILabel (LabelExtension)
+ (UILabel *)LabelWithText:(NSString *)text
                   bgColor:(UIColor *)bgColor
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat )fontSize
              numberOfLine:(NSInteger)numberOfLine
{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = numberOfLine;
    return label;
}
@end
