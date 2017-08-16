//
//  ALViewViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALViewViewController.h"
#import "Masonry.h"
#import "UIButton+ButtonExtension.h"
@interface ALViewViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *minusButton;
@property (nonatomic, assign) NSInteger count;

@end

@implementation ALViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.redView = [self creatViewWithColor:[UIColor redColor]];
    self.greenView = [self creatViewWithColor:[UIColor greenColor]];
    self.blueView = [self creatViewWithColor:[UIColor blueColor]];
    
    [self.view addSubview:self.redView];
    [self.redView addSubview:self.greenView];
    [self.redView addSubview:self.blueView];
    
    [self.view addSubview:self.addButton];
    [self.view addSubview:self.minusButton];
    
    [self makeConstraints];
}

- (UIView *)creatViewWithColor:(UIColor *)color
{
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = color;
    return tempView;
}

-(UIButton *)addButton
{
    if (!_addButton) {
        _addButton = [UIButton ButtonWithTitle:@"点我+" bgColor:[UIColor cyanColor] textColor:[UIColor whiteColor] fontSize:30];
        [_addButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

-(UIButton *)minusButton
{
    if (!_minusButton) {
        _minusButton = [UIButton ButtonWithTitle:@"点我-" bgColor:[UIColor grayColor] textColor:[UIColor whiteColor] fontSize:30];
        [_minusButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _minusButton;
}

- (void)makeConstraints
{
    WEAKSELF
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
    }];
    
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(120);
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.greenView.mas_bottom).offset(10);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(200);
        make.bottom.equalTo(weakSelf.redView).offset(-40);
    }];
    
    /*
     因为redView 只控制了top，left，right，所以redView的高度未知
     greenView的位置能够根据其约束确定
     blueView的位置也能确定，并且限制了它到redView的底部距离，这样redView的高度可以根据greenView和blueView确定
     
     约束就像我们一步步的画画，当你最后能画出想要的图画时，就对了。当你
     */
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.redView.mas_bottom).offset(44);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(100);
    }];
    
    [self.minusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(weakSelf.addButton);
        make.left.mas_equalTo(40);
        make.height.width.equalTo(weakSelf.addButton);
    }];
}

-(NSInteger)count
{
    if (_count <= 0) {
        return 1;
    }
    return _count;
}

- (void)clickButton:(UIButton *)sender
{
    WEAKSELF
    
    if (sender == self.addButton) {
        self.count ++;
    }else{
        self.count --;
    }
    
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.greenView.mas_bottom).offset(10 * weakSelf.count);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
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
