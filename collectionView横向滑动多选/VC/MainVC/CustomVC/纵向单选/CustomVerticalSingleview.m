//
//  CustomVerticalSingleview.m
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "CustomVerticalSingleview.h"
#import "CustomCollectionViewCell.h"

#import "Masonry.h"

@interface CustomVerticalSingleview ()<UICollectionViewDelegate,UICollectionViewDataSource,CustomCollectionViewCellDelegate>
@property(nonatomic, strong)UICollectionView *collectView;
@property(nonatomic, copy)NSString *selectImgid;
@property(nonatomic, copy)NSString *selectImgUrl;
@property(nonatomic, assign)CGFloat item_height;
@end
@implementation CustomVerticalSingleview

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

        [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(self).mas_offset(0);
            make.height.mas_equalTo(@1).priorityLow();//设置一个高度，以便赋值后更新
        }];
    }
    return self;
    
}
- (void)setNumRow:(NSInteger)numRow {
    _numRow = numRow;
    self.item_height = (self.frame.size.width-10*_numRow)/_numRow;
    [self.collectView reloadData];
    [self.collectView layoutIfNeeded];
    [self.collectView setNeedsLayout];
    CGRect rectSize = self.frame;
    [self.collectView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.collectView.collectionViewLayout.collectionViewContentSize.height));
    }];
    rectSize.size.height =  self.collectView.collectionViewLayout.collectionViewContentSize.height; // 高度
    self.frame = rectSize;
}
- (void)setImageArr:(NSArray *)imageArr {
    _imageArr = imageArr;
}
- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    for (int i = 0; i < _imageArr.count; i ++) {
        if (_selectIndex == i) {
            ImgModel *model = _imageArr[i];
            model.isSelect = YES;
            self.selectImgid = model.imgId;
            self.selectImgUrl = model.imgUrl;
        }
    }
}
-(UICollectionView *)collectView{
    if (!_collectView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        //横向
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
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
    return UIEdgeInsetsMake(10, 5, 10, 5);//分别为上、左、下、右
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(self.item_height,self.item_height);
    return size;
}
//这个是两行cell之间的最小间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//两个cell之间的最小间距间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)clickBtn:(CustomCollectionViewCell *)cell {
    NSIndexPath * indexPath = [self.collectView indexPathForCell:cell];
    for (ImgModel * signerModel in self.imageArr) {
        signerModel.isSelect = NO;
    }
    ImgModel * model = self.imageArr[indexPath.row];
    model.isSelect = YES;
    [self.collectView reloadData];
    
    if (model.isSelect) {
        
        _selectImgid = model.imgId;
        _selectImgUrl = model.imgUrl;
    }
    if (self.Delegate && [self.Delegate respondsToSelector:@selector(clickBtnSingle:select:selectImgUrl:)]) {
        [self.Delegate clickBtnSingle:indexPath.item select:_selectImgid selectImgUrl:_selectImgUrl];
    }
}
@end
