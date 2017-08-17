//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by JIN on 2017/8/15.
//  Copyright © 2017年 JIN. All rights reserved.
//

#import "ViewController.h"
#import "ALViewViewController.h"
#import "ALLabelViewController.h"
#import "ALImageViewController.h"
#import "ALTableViewController.h"
#import "ALTextViewController.h"
#import "ALCollectionViewController.h"
#import "ALScrollViewController.h"
@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = @[@"UIView",
                       @"UILabel",
                       @"UIImageView",
                       @"UITextView",
                       @"UITableView",
                       @"UICollectionView",
                       @"UIScrollView"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NSString *title = self.dataArray[indexPath.row];
    UIViewController *viewController;
    if ([title isEqualToString:@"UIView"]) {
        
        viewController = [[ALViewViewController alloc] init];
        
    }else if ([title isEqualToString:@"UILabel"]) {
        
        viewController = [[ALLabelViewController alloc] init];
        
    }else if ([title isEqualToString:@"UIImageView"]) {
        
        viewController = [[ALImageViewController alloc] init];
        
    }else if ([title isEqualToString:@"UITextView"]){
        
        viewController = [[ALTextViewController alloc] init];
        
    }else if ([title isEqualToString:@"UITableView"]){
        
        viewController = [[ALTableViewController alloc] init];
        
    }else if ([title isEqualToString:@"UICollectionView"]){
        
        viewController = [[ALCollectionViewController alloc] init];
        
    }else if ([title isEqualToString:@"UIScrollView"]){
        
        viewController = [[ALScrollViewController alloc]init];
        
    }
    
    viewController.title = title;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
