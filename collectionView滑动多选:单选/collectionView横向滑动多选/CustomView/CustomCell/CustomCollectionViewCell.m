//
//  CustomCollectionViewCell.m
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@implementation CustomCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.btn];
        
        [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(self.contentView).mas_offset(0);
        }];
        
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.mas_equalTo(self.contentView).mas_offset(0);
            make.height.mas_equalTo(@35.0);
            make.width.mas_equalTo(@35.0);

        }];
    }
    return self;
    
}
- (void)setModel:(ImgModel *)model {
    _model = model;
    [_img sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:[UIImage imageNamed:@"zhanweitu"]];
    if (model.isSelect) {
        [self.btn setImage:[UIImage imageNamed:@"select"] forState:(UIControlStateNormal)];
    }else {
        [self.btn setImage:[UIImage imageNamed:@"unselect"] forState:(UIControlStateNormal)];
    }
}
- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] init];
        _img.backgroundColor = [UIColor whiteColor];
        _img.clipsToBounds = YES;
        _img.contentMode=UIViewContentModeScaleAspectFill;
        _img.userInteractionEnabled = YES;
    }
    return _img;
}
- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self action:@selector(btnClcck) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btn;
}
- (void)btnClcck {
    if (self.cellDelegate && [self.cellDelegate respondsToSelector:@selector(clickBtn:)]) {
        [self.cellDelegate clickBtn:self];
    }
}
@end
