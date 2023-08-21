//
//  CustomVerticalSingleview.h
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CustomVerticalSingleview;

@protocol CustomVerticalSingleviewDelegate <NSObject>
/**
 *  按钮点击代理
 *
 */
- (void)clickBtnSingle:(NSInteger)index select:(NSString *)selectImgID selectImgUrl:(NSString *)selectImgUrl;

@end
@interface CustomVerticalSingleview : UIView
@property(nonatomic, strong)NSArray *imageArr;
@property (nonatomic, weak) id<CustomVerticalSingleviewDelegate> Delegate;
//默认选中index
@property(nonatomic, assign)NSInteger selectIndex;
@property(nonatomic, assign)NSInteger numRow;
@end

NS_ASSUME_NONNULL_END
