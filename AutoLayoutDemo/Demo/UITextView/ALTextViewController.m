//
//  ALTextViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALTextViewController.h"
#import "Masonry.h"

@interface ALTextViewController ()
<
UITextViewDelegate
>
@property (nonatomic, strong) UITextView *textView;


@end

@implementation ALTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
     [self setAutomaticallyAdjustsScrollViewInsets:NO];//关于这个设置我写了篇博客http://blog.csdn.net/qq_29909323/article/details/77239577   是为了解决这里textView内容偏移的
    [self.view addSubview:self.textView];
    [self makeContraints];
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = [UIColor grayColor];
        _textView.scrollEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:20];
    }
    return _textView;
}

- (void)makeContraints
{
    WEAKSELF
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.mas_equalTo(100);
        make.height.greaterThanOrEqualTo(@100);
    }];
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
