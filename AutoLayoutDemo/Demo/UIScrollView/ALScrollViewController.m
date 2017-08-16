//
//  ALScrollViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALScrollViewController.h"
#import "Masonry.h"
#import "ALScrollView.h"
@interface ALScrollViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ALScrollView *subView;

@end

@implementation ALScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.subView];
    WEAKSELF
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).insets(UIEdgeInsetsZero);
    }];
    
    [self.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.scrollView).insets(UIEdgeInsetsZero);
        make.width.mas_equalTo(SCREEN_WIDTH);//宽固定，contentSize自动计算时宽度也为固定，竖直方向滚动.如果不设置此约束，那么横竖都可以滚动。由于宽度没有固定过数值，所以会根据subView中的子视图的最大宽度自适应，label 的宽度系统默认为一行显示完的宽度，imageView的宽度为图片宽度，取所有子视图的最大宽度
    }];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (ALScrollView *)subView
{
    if (!_subView) {
        _subView = [[ALScrollView alloc] init];
    }
    return _subView;
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
