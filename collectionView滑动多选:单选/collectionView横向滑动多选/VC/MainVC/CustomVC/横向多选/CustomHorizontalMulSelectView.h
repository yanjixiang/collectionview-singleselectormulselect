//
//  CustomViewAdjective.h
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CustomHorizontalMulSelectView;

@protocol CustomHorizontalMulSelectViewDelegate <NSObject>
/**
 *  按钮点击代理
 *
 */
- (void)clickBtnHorizontalMul:(NSInteger)index selectArray:(NSArray *)selectImgIDArray;

@end
@interface CustomHorizontalMulSelectView : UIView
@property(nonatomic, strong)NSArray *imageArr;
@property (nonatomic, weak) id<CustomHorizontalMulSelectViewDelegate> Delegate;
//默认选中index
@property(nonatomic, assign)NSInteger selectIndex;
@end

NS_ASSUME_NONNULL_END
