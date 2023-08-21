//
//  CustomCollectionViewCell.h
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgModel.h"
NS_ASSUME_NONNULL_BEGIN
@class CustomCollectionViewCell;

@protocol CustomCollectionViewCellDelegate <NSObject>
/**
 *  按钮点击代理
 *
 *  @param cell 按钮所属cell
 */
- (void)clickBtn:(CustomCollectionViewCell *)cell;

@end
@interface CustomCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong)UIImageView *img;
@property(nonatomic, strong)UIButton *btn;
@property(nonatomic, strong)ImgModel *model;
@property (nonatomic, weak) id<CustomCollectionViewCellDelegate> cellDelegate;

@end

NS_ASSUME_NONNULL_END
