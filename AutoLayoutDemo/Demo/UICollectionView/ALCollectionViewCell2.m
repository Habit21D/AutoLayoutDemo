//
//  ALCollectionViewCell2.m
//  AutoLayoutDemo
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALCollectionViewCell2.h"
#import "UILabel+LabelExtension.h"
#import "Masonry.h"
@interface ALCollectionViewCell2 ()
@property (nonatomic , strong) UIView *bgView;
@property (nonatomic , strong) UILabel *label;
@end

@implementation ALCollectionViewCell2

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.label];
        [self makeConstraints];
    }
    return self;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor redColor];
        _bgView.layer.cornerRadius = 5;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel LabelWithText:@"" bgColor:[UIColor redColor] textColor:[UIColor whiteColor] fontSize:16 numberOfLine:1];
    
    }
    return _label;
}

- (void)makeConstraints {
    WEAKSELF
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(5, 0, 5, 0));
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.bgView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
}

- (void)loadUIWithTitle:(NSString *)title {
    self.label.text = title;
    [self layoutIfNeeded];
}
@end
