//
//  ViewController.m
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "ViewController.h"

#import "HorizontalMulVC.h"
#import "HorizontalSingleVC.h"
#import "VerticalMulVC.h"
#import "VerticalSingleVC.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"collectionview横向/纵向单选、多选";
    [self CreateTable];
   
}
- (void)CreateTable {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = NO;
    NSArray *arr = @[@"collectionView横向滑动单选",@"collectionView横向滑动多选",@"collectionView纵向高度自适应单选",@"collectionView纵向高度自适应多选"];
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
               //横向单选
                HorizontalSingleVC *detail = [[HorizontalSingleVC alloc] init];
                [self.navigationController pushViewController:detail animated:YES];
            }
            break;
        case 1:
        {
            //横向多选
            HorizontalMulVC *detail = [[HorizontalMulVC alloc] init];
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        case 2:
        {
            //纵向单选
            VerticalSingleVC *detail = [[VerticalSingleVC alloc] init];
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        case 3:
        {
            //纵向多选
            VerticalMulVC *detail = [[VerticalMulVC alloc] init];
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
