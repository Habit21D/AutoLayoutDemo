//
//  ALCollectionViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALCollectionViewController.h"
#import "ALCollectionCell.h"
#import "Masonry.h"
@interface ALCollectionViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imgArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *subTitleArray;

@end

@implementation ALCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imgArray = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"1.jpg",@"2.jpg"];
    self.titleArray = @[@"这里是示例标题",@"这里是示例标题这里是示例标题这里是示例标题这里是示例标题",@"这里是示例标题这里是示例标题这里是示例标题这里是示例标题",@"这里是示例标题这里是示例标题",@"这里是示例标题这里是示例标题这里是示例标题这里是示例标题这里是示例标题这里是示例标题这里是示例标题这里是示例标题这里是示例标题这里是示例标题",@"这里是示例标题"];
    self.subTitleArray = @[@"这里是示例副标题这里是示例副标题这里是示例副标题",@"这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题",@"这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题",@"这里是示例副标题这里是示例副标题",@"这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题",@"这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题这里是示例副标题"];
    
    [self.view addSubview:self.collectionView];
    
    WEAKSELF
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH/2 - 10, 150);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ALCollectionCell class] forCellWithReuseIdentifier:@"ALCollectionCell"];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return MIN(MIN(self.titleArray.count, self.subTitleArray.count), self.imgArray.count);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ALCollectionCell" forIndexPath:indexPath];
    NSInteger index = indexPath.row;
    [cell loadUIWithImageNamed:self.imgArray[index] title:self.titleArray[index] subTitle:self.subTitleArray[index]];
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
