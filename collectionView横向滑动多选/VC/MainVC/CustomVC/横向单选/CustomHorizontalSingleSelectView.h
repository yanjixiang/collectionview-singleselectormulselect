//
//  CustomViewAdjectSingleSelect.h
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CustomHorizontalSingleSelectView;

@protocol CustomHorizontalSingleSelectViewDelegate <NSObject>
/**
 *  按钮点击代理
 *
 */
- (void)clickBtnHorizontalSingle:(NSInteger)index select:(NSString *)selectImgID selectImgUrl:(NSString *)selectImgUrl;

@end
@interface CustomHorizontalSingleSelectView : UIView
@property(nonatomic, strong)NSArray *imageArr;
@property (nonatomic, weak) id<CustomHorizontalSingleSelectViewDelegate> Delegate;
//默认选中index
@property(nonatomic, assign)NSInteger selectIndex;
@end

NS_ASSUME_NONNULL_END
