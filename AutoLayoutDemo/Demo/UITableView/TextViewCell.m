//
//  TextViewCell.m
//  OCDemo
//
//  Created by JIN on 2017/8/11.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "TextViewCell.h"
#import "Masonry.h"

@interface TextViewCell ()
<
UITextViewDelegate
>

@end

@implementation TextViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.textView];
         __weak typeof(self) weakSelf = self;
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.contentView);
        }];
    }
    return self;
}

-(UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        _textView.backgroundColor = [UIColor greenColor];
        _textView.font = [UIFont systemFontOfSize:20];
        _textView.text = @"这里是输入框，可根据输入内容变高";
        _textView.scrollEnabled = NO;
        _textView.delegate = self;
    }
    return _textView;
}

-(void)textViewDidChange:(UITextView *)textView
{
    /*
     sizeToFit自动计算高度不正确是可以使用
     CGFloat height = [textView sizeThatFits:CGSizeMake(CGRectGetWidth(textView.frame), 0)].height;
    
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    */
     
    [textView sizeToFit];
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    
    return (UITableView *)tableView;
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
