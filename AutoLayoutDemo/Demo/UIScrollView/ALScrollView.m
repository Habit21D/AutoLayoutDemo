//
//  ALScrollView.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/16.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALScrollView.h"
#import "UILabel+LabelExtension.h"
#import "Masonry.h"
@interface ALScrollView()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end
@implementation ALScrollView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self addSubview:self.imageView1];
        [self addSubview:self.imageView2];
        [self addSubview:self.imageView3];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subTitleLabel];
        
        [self makeConstraints];
        
        self.imageView1.image = [UIImage imageNamed:@"1.jpg"];
        self.imageView2.image = [UIImage imageNamed:@"2.jpg"];
        self.imageView3.image = [UIImage imageNamed:@"3.jpg"];
        self.titleLabel.text = @"scrollView使用autolayout时contentSize是不需要设置的，可以根据内容计算";
        self.subTitleLabel.text = @"所以呢，由于contentSize根据内容确定，所以内容的约束必须足够确定大小。而且需要确定滚动方向。指定view的宽或者高就可以指定滚动方向了。否则就是横竖都可以滚动！！！";
    }
    return self;
}


- (UIImageView *)imageView1
{
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] init];
        _imageView1.contentMode = UIViewContentModeScaleAspectFill;
        _imageView1.layer.masksToBounds = YES;
    }
    return _imageView1;
}

- (UIImageView *)imageView2
{
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc] init];
        _imageView2.contentMode = UIViewContentModeScaleAspectFill;
        _imageView2.layer.masksToBounds = YES;
    }
    return _imageView2;
}

- (UIImageView *)imageView3
{
    if (!_imageView3) {
        _imageView3 = [[UIImageView alloc] init];
        _imageView3.contentMode = UIViewContentModeScaleAspectFill;
        _imageView3.layer.masksToBounds = YES;
    }
    return _imageView3;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel LabelWithText:@"" bgColor:[UIColor redColor] textColor:[UIColor whiteColor] fontSize:16 numberOfLine:0];
    }
    return _titleLabel;
}

-(UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel LabelWithText:@"" bgColor:[UIColor cyanColor] textColor:[UIColor blackColor] fontSize:13 numberOfLine:0];
    }
    return _subTitleLabel;
}

- (void)makeConstraints
{
   
    WEAKSELF
    [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(weakSelf.imageView1.mas_bottom).offset(10);
    }];
    
    [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.imageView1);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(10);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.titleLabel);
        make.top.equalTo(weakSelf.imageView2.mas_bottom).offset(10);
    }];
    
    [self.imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.imageView1);
        make.top.equalTo(weakSelf.subTitleLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(-50);
    }];
}

@end
