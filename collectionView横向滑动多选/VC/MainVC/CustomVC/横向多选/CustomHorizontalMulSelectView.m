//
//  CustomViewAdjective.m
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "CustomHorizontalMulSelectView.h"
#import "CustomCollectionViewCell.h"
#define item_height self.frame.size.height - 20

@interface CustomHorizontalMulSelectView ()<UICollectionViewDelegate,UICollectionViewDataSource,CustomCollectionViewCellDelegate>
@property(nonatomic, strong)UICollectionView *collectView;
@property(nonatomic, strong)NSMutableArray *selectImgArr;

@end
@implementation CustomHorizontalMulSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectView];
        _selectImgArr = [NSMutableArray array];

    }
    return self;
    
}
- (void)setImageArr:(NSArray *)imageArr {
    _imageArr = imageArr;
    
    [self.collectView reloadData];
}
- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    for (int i = 0; i < _imageArr.count; i ++) {
        if (_selectIndex == i) {
            ImgModel *model = _imageArr[i];
            model.isSelect = YES;
            [self.selectImgArr addObject:model.imgId];
        }
        
    }
}
-(UICollectionView *)collectView{
    if (!_collectView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        //横向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
        _collectView.backgroundColor = [UIColor whiteColor];
        _collectView.delegate=self;
        _collectView.dataSource=self;
        [_collectView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    }
    return _collectView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return _imageArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    ImgModel *model = self.imageArr[indexPath.item];
    cell.cellDelegate = self;
    
    cell.model = model;
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);//分别为上、左、下、右
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(item_height,item_height);
    return size;
}
//这个是两行cell之间的最小间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//两个cell之间的最小间距间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)clickBtn:(CustomCollectionViewCell *)cell {
    NSIndexPath * indexPath = [self.collectView indexPathForCell:cell];
    ImgModel *model = self.imageArr[indexPath.item];
   
    model.isSelect = !model.isSelect;
    [UIView performWithoutAnimation:^{
        [self.collectView reloadItemsAtIndexPaths:@[indexPath]];
    }];
   
    if (model.isSelect) {
        [_selectImgArr addObject:model.imgId];

    }else {
        [_selectImgArr removeObject:model.imgId];

    }
    
    if (self.Delegate && [self.Delegate respondsToSelector:@selector(clickBtnHorizontalMul:selectArray:)]) {
        [self.Delegate clickBtnHorizontalMul:indexPath.item selectArray:[_selectImgArr mutableCopy]];
    }
}
@end
