//
//  UIButton+ButtonExtension.h
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ButtonExtension)
+ (UIButton *)ButtonWithTitle:(NSString *)title
                      bgColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     fontSize:(CGFloat)fontSize;
@end
