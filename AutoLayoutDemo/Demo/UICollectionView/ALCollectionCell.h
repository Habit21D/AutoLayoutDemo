//
//  ALCollectionCell.h
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/16.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALCollectionCell : UICollectionViewCell

- (void)loadUIWithImageNamed:(NSString *)imageNamed
                       title:(NSString *)title
                    subTitle:(NSString *)subtitle;

@end
