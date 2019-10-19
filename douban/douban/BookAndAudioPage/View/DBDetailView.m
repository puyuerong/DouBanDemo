//
//  DBDetailView.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/18.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBDetailView.h"
#import "Masonry.h"
@implementation DBDetailView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    _scrollView = [[UIScrollView alloc] init];
    _moviewImageView = [[UIImageView alloc] init];
    _nameLabel = [[UILabel alloc] init];
    _yearLabel = [[UILabel alloc] init];
    _detailLabel = [[UILabel alloc] init];
    _wantButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _hadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _assessImageView = [[UIImageView alloc] init];
    _titleLabel = [[UILabel alloc] init];
    _gradeLabel = [[UILabel alloc] init];
    _numberLabel = [[UILabel alloc] init];
    [self addSubview:_scrollView];
    [_scrollView addSubview:_moviewImageView];
    [_scrollView addSubview:_nameLabel];
    [_scrollView addSubview:_yearLabel];
    [_scrollView addSubview:_detailLabel];
    [_scrollView addSubview:_wantButton];
    [_scrollView addSubview:_hadButton];
    [_scrollView addSubview:_assessImageView];
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_gradeLabel];
    [_scrollView addSubview:_numberLabel];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    _scrollView.contentSize = CGSizeMake(width, hight * 5);
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(self);
        make.top.equalTo(self);
        make.left.equalTo(self);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
