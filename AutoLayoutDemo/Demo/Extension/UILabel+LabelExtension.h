//
//  UILabel+LabelExtension.h
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelExtension)
+ (UILabel *)LabelWithText:(NSString *)text
                   bgColor:(UIColor *)bgColor
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat )fontSize
              numberOfLine:(NSInteger)numberOfLine;
@end
