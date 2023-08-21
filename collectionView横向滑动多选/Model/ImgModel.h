//
//  ImgModel.h
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImgModel : NSObject
@property(nonatomic, copy)NSString *imgUrl;
@property(nonatomic, copy)NSString *imgId;

@property(nonatomic, assign)BOOL isSelect;
@end

NS_ASSUME_NONNULL_END
