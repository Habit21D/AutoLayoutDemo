//
//  CustomCell.m
//  OCDemo
//
//  Created by JIN on 2017/8/11.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "CustomCell.h"
#import "Masonry.h"

@interface CustomCell ()

@end

@implementation CustomCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageViewRef];
        
        WEAKSELF
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(-120);
            
        }];
        
        [self.imageViewRef mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(10);
            make.top.equalTo(weakSelf.label.mas_bottom).offset(10);
            make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-10);
        }];
    }
    return self;
}

-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor redColor];
        _label.numberOfLines = 0;
        
    }
    return _label;
}

-(UIImageView *)imageViewRef
{
    if (!_imageViewRef) {
        _imageViewRef = [[UIImageView alloc]init];
        _imageViewRef.backgroundColor = [UIColor magentaColor];
    }
    return _imageViewRef;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    self.label.text = title;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
