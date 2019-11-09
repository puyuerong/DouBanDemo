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
    _progressView1 = [[UIProgressView alloc] init];
    _progressView2 = [[UIProgressView alloc] init];
    _progressView3 = [[UIProgressView alloc] init];
    _progressView4 = [[UIProgressView alloc] init];
    _progressView5 = [[UIProgressView alloc] init];
    _introduceLabel = [[UILabel alloc] init];
    [self addSubview:_scrollView];
    [_scrollView addSubview:_moviewImageView];
    [_scrollView addSubview:_nameLabel];
    [_scrollView addSubview:_yearLabel];
    [_scrollView addSubview:_detailLabel];
    [_scrollView addSubview:_wantButton];
    [_scrollView addSubview:_hadButton];
    [_scrollView addSubview:_assessImageView];
    [_assessImageView addSubview:_titleLabel];
    [_assessImageView addSubview:_gradeLabel];
    [_assessImageView addSubview:_numberLabel];
    [_assessImageView addSubview:_progressView1];
    [_assessImageView addSubview:_progressView2];
    [_assessImageView addSubview:_progressView3];
    [_assessImageView addSubview:_progressView4];
    [_assessImageView addSubview:_progressView5];
    [_scrollView addSubview:_introduceLabel];
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
    
    int width0 = 0.27 * width;
    int hight0 = 0.21 * hight;
    int left = 0.053 * width;
    int top = 0.12 * hight;
    [_moviewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self).offset(left);
        make.top.equalTo(self).offset(top);
    }];
    
    
    _nameLabel.font = [UIFont systemFontOfSize:25];
    _nameLabel.text = _name;
    _nameLabel.numberOfLines = 0;
    _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [_nameLabel.text boundingRectWithSize:CGSizeMake(250, 660) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_nameLabel.font} context:nil].size;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(size.width));
        make.height.equalTo(@(size.height));
        make.left.equalTo(self.moviewImageView.mas_right).offset(15);
        make.top.equalTo(self.moviewImageView.mas_top).offset(0);
    }];
    _nameLabel.textColor = [UIColor whiteColor];
    
    
    _yearLabel.font = [UIFont systemFontOfSize:18];
    _yearLabel.numberOfLines = 0;
    _yearLabel.text = _year;
    _yearLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize sizeY = [_yearLabel.text boundingRectWithSize:CGSizeMake(230, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_yearLabel.font} context:nil].size;
    [_yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(sizeY.width));
        make.height.equalTo(@(sizeY.height));
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
    }];
    _yearLabel.textColor = [UIColor whiteColor];
    
    _detailLabel.font = [UIFont systemFontOfSize:13];
    _detailLabel.text = _describe;;
    _detailLabel.numberOfLines = 0;
    _detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize sizeDetail = [_detailLabel.text boundingRectWithSize:CGSizeMake(250, 660) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_detailLabel.font} context:nil].size;
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(sizeDetail.width));
        make.height.equalTo(@(sizeDetail.height));
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
        make.top.equalTo(self.yearLabel.mas_bottom).offset(10);
    }];
    _detailLabel.textColor = [UIColor grayColor];
 
    width0 = 0.293 * width;
    hight0 = 0.06 * hight;
    [_hadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
        make.top.equalTo(self.detailLabel.mas_bottom).offset(20);
    }];
    UIImage *image = [[UIImage imageNamed:@"had.PNG"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_hadButton setImage:image forState:UIControlStateNormal];

    [_wantButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.hadButton.mas_right).offset(20);
        make.top.equalTo(self.hadButton.mas_top).offset(0);
    }];
    
    
    width0 = 0.9 * width;
    hight0 = 0.18 * hight;
    [_assessImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wantButton.mas_bottom).offset(30);
        make.left.equalTo(self.moviewImageView.mas_left).offset(0);
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
    }];
    _assessImageView.image = [[UIImage imageNamed:@"assess.PNG"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    width0 = 0.133 * width;
    left = 0.133 * width;
    top = 0.045 * hight;
    _gradeLabel.font = [UIFont systemFontOfSize:30];
    [_gradeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.top.equalTo(self.assessImageView.mas_top).offset(top);
        make.left.equalTo(self.assessImageView.mas_left).offset(left);
    }];
    
    left = 0.16 * width;
    width0 = 0.4 * width;
    hight0 =0.006 * hight;
    _progressView1.backgroundColor = [UIColor grayColor];
    _progressView1.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left);
        make.top.equalTo(self.gradeLabel.mas_top).offset(0);
    }];
    
    _progressView2.backgroundColor = [UIColor grayColor];
    _progressView2.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left);
        make.top.equalTo(self.progressView1.mas_bottom).offset(1);
    }];

    _progressView3.backgroundColor = [UIColor grayColor];
    _progressView3.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left);
        make.top.equalTo(self.progressView2.mas_bottom).offset(1);
    }];


    _progressView4.backgroundColor = [UIColor grayColor];
    _progressView4.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left);
        make.top.equalTo(self.progressView3.mas_bottom).offset(1);
    }];


    _progressView5.backgroundColor = [UIColor grayColor];
    _progressView5.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left);
        make.top.equalTo(self.progressView4.mas_bottom).offset(1);
    }];
 
    
    [_introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.assessImageView.mas_width);
        make.height.equalTo(self.assessImageView.mas_height);
        make.top.equalTo(self.assessImageView.mas_bottom).offset(30);
        make.left.equalTo(self.assessImageView.mas_left).offset(0);
    }];
    _introduceLabel.textColor = [UIColor whiteColor];
    _introduceLabel.font = [UIFont systemFontOfSize:20];
}
//
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
