//
//  ALLabelViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALLabelViewController.h"
#import "UILabel+LabelExtension.h"
#import "Masonry.h"
@interface ALLabelViewController ()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *textLabel;


@end

@implementation ALLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.textLabel];
    [self makeConstraints];
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor redColor];
    }
    return _contentView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel LabelWithText:@"好好学习autolayout你的代码将会更简洁，迭代将会更方便，不信可以试一试" bgColor:[UIColor blueColor] textColor:[UIColor whiteColor] fontSize:20 numberOfLine:0];
    }
    return _titleLabel;
}

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [UILabel LabelWithText:@"还在使用frame？那真是真真是，算了不说了，因为我之前虽然用了约束，但是都是手动算高度，简直浪费了约束这个强大的功能，整天羡慕着安卓的方便，确不知道iOS上也有变高，自动计算高度这东西，而且方便至极！！！！！！" bgColor:[UIColor greenColor] textColor:[UIColor blackColor] fontSize:14 numberOfLine:0];
    }
    return _textLabel;
}

- (void)makeConstraints
{
    WEAKSELF
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(100);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.titleLabel);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(40);
        make.bottom.mas_equalTo(-20);//这里把contentView的约束补全，否则不知道它的底边位置
    }];
    
    /*
     label的高度系统自己根据文字计算，不需要我们再设置height。
     我们再也不用麻烦的算高度了！！！！！
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
