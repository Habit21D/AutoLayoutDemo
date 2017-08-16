//
//  ALCollectionCell.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/16.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALCollectionCell.h"
#import "UILabel+LabelExtension.h"
#import "Masonry.h"
@interface ALCollectionCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@end

@implementation ALCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor magentaColor];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        
        [self makeConstraints];
    }
    return self;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
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
    /*
     与UITableView不同的是，tableViewCell的宽度可以根据UITableView的约束或者frame确定
     但是collectionView不同，所以在collectionViewCell中需要能够确定cell 的宽度
     */
    WEAKSELF
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(120);
        make.width.mas_equalTo(SCREEN_WIDTH);//cell的宽度依据这个约束确定，不然imageview的宽度依赖cell，cell的宽度依赖imageview，那样还是没有确定宽度。
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(weakSelf.imageView.mas_bottom).offset(10);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.titleLabel);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(5);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)loadUIWithImageNamed:(NSString *)imageNamed
                       title:(NSString *)title
                    subTitle:(NSString *)subtitle
{
    self.imageView.image = [UIImage imageNamed:imageNamed];
    self.titleLabel.text = title;
    self.subTitleLabel.text = subtitle;
}
@end
