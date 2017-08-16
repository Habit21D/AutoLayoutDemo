//
//  ALTableViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ALTableViewController.h"
#import "Masonry.h"
#import "CustomCell.h"
#import "TextViewCell.h"
@interface ALTableViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *imgArray;

@property (nonatomic, strong) CustomCell *customCell;

@end

@implementation ALTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
}

-(NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"这里有一个需要特别注意的问题，也是效率问题。UITableView是一次性计算完所有Cell的高度，如果有1W个Cell",@"看了代码，可能你有点疑问，为何这儿要加1呢？笔者告诉你，如果不加1，结果就是错误的，Cell中UILabel将显示不正确。原因就是因为这行代码CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];由于是在cell.contentView上调用这个方法，那么返回的值将是contentView的高度，UITableViewCell的高度要比它的contentView要高1,也就是它的分隔线的高度。如果你不相信，那请看C1.xib的属性，比较下面两张图。",@"将Cell中UILabel的背景色",@"我们组分享会上分享了页面布局的一些写法，中途提到了AutoLayout，会后我决定将很久前挖的一个坑给填起来（还有好多坑就不说了，说了不填更毁形象了）",@"Masonry代码如下",@"大叔的话"];
    }
    return _dataArray;
}

- (NSArray *)imgArray
{
    if (!_imgArray) {
        _imgArray = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"1.jpg",@"2.jpg"];
    }
    return _imgArray;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"CustomCell"];
        [_tableView registerClass:[TextViewCell class] forCellReuseIdentifier:@"TextViewCell"];
        
        _tableView.estimatedRowHeight = 40;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MIN(self.dataArray.count, self.imgArray.count) + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"TextViewCell"];
        
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
        CustomCell *customCell = (CustomCell *)cell;
        customCell.title = self.dataArray[indexPath.row - 1];
        UIImage *image = [UIImage imageNamed:self.imgArray[indexPath.row - 1]];
        customCell.imageViewRef.image = image;
        [customCell.imageViewRef mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(([UIScreen mainScreen].bounds.size.width - 20)* image.size.height / image.size.width);
        }];
    }
    
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
