//
//  ALCollectionViewController2.m
//  AutoLayoutDemo
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALCollectionViewController2.h"
#import "ALCollectionViewCell2.h"
#import "Masonry.h"
@interface ALCollectionViewController2 ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ALCollectionViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    self.titleArray = @[@"战狼",@"北京",@"中华民族",@"大自然",@"这个标题有点长",@"无所谓",@"淡然",@"xcode9.0",@"iOS11",@"iphone x"];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.estimatedItemSize = CGSizeMake(100, 30);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor cyanColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ALCollectionViewCell2 class] forCellWithReuseIdentifier:@"ALCollectionViewCell2"];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALCollectionViewCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ALCollectionViewCell2" forIndexPath:indexPath];
    [cell loadUIWithTitle:self.titleArray[indexPath.row]];
    return cell;
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
