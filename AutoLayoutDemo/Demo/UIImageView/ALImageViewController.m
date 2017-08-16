//
//  ALImageViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALImageViewController.h"
#import "Masonry.h"
@interface ALImageViewController ()
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;

@end

@implementation ALImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageView1];
    [self.view addSubview:self.imageView2];
    
    [self makeConstraints];
}

- (UIImageView *)imageView1
{
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc]init];
        _imageView1.backgroundColor = [UIColor magentaColor];
        _imageView1.image = [UIImage imageNamed:@"1.jpg"];
    }
    return _imageView1;
}

- (UIImageView *)imageView2
{
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc]init];
        _imageView2.backgroundColor = [UIColor cyanColor];
        _imageView2.image = [UIImage imageNamed:@"2.jpg"];
    }
    return _imageView2;
}

- (void)makeConstraints
{
    WEAKSELF
    [self.imageView1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(40);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200 * weakSelf.imageView1.image.size.height / weakSelf.imageView1.image.size.width);
    }];
    
    [self.imageView2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imageView1.mas_bottom).offset(44);
        make.left.width.equalTo(weakSelf.imageView1);
        make.height.mas_equalTo(200 * weakSelf.imageView2.image.size.height / weakSelf.imageView2.image.size.width);
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
