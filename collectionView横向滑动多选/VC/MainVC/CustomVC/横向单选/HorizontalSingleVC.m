//
//  HorizontalSingleVC.m
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "HorizontalSingleVC.h"
#import "ImgModel.h"
#import "CustomHorizontalSingleSelectView.h"
@interface HorizontalSingleVC ()<CustomHorizontalSingleSelectViewDelegate>

@end

@implementation HorizontalSingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"collectionview横向滑动单选";
    
    //数据
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i ++) {
        ImgModel *model = [[ImgModel alloc] init];
        model.imgId = [NSString stringWithFormat:@"%d",i];
        model.imgUrl = @"https://img13.360buyimg.com/n1/s350x449_jfs/t21085/241/552417402/131946/425aaf9e/5b122c03N780b5219.jpg!cc_350x449.jpg";
        [array addObject:model];
    }
    //横向单选
    CustomHorizontalSingleSelectView *custom2 = [[CustomHorizontalSingleSelectView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 150)];
    custom2.imageArr = [array mutableCopy];
    //默认选中index
    custom2.selectIndex = 0;
    custom2.Delegate = self;
    [self.view addSubview:custom2];
}
//横向单选
- (void)clickBtnHorizontalSingle:(NSInteger)index select:(NSString *)selectImgID selectImgUrl:(NSString *)selectImgUrl {
    NSLog(@"2当前点击图片index-----%ld ------ 选中图片id%@------选中图片地址url%@",index,selectImgID,selectImgUrl);
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
