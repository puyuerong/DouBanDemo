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
    _actorScrollView = [[UIScrollView alloc] init];
    _pictureScrollView = [[UIScrollView alloc] init];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel2 = [[UILabel alloc] init];
    _allLabel1 = [[UILabel alloc] init];
    _allLabel2 = [[UILabel alloc] init];
    _typeScrollView = [[UIScrollView alloc] init];
    _includeLabel = [[UILabel alloc] init];
    _backImageVivew = [[UIImageView alloc] init];
    _hideLabel1 = [[UILabel alloc] init];
    _hideLabel2 = [[UILabel alloc] init];
    _shortCommitTableView = [[UITableView alloc] init];
    
    [_scrollView addSubview:_moviewImageView];
    [_scrollView addSubview:_nameLabel];
    [_scrollView addSubview:_yearLabel];
    [_scrollView addSubview:_detailLabel];
    [_scrollView addSubview:_wantButton];
    [_scrollView addSubview:_hadButton];
    [_scrollView addSubview:_assessImageView];
    [_assessImageView addSubview:_backImageVivew];
    [_assessImageView addSubview:_hideLabel1];
    [_assessImageView addSubview:_hideLabel2];
    [_assessImageView addSubview:_titleLabel];
    [_assessImageView addSubview:_gradeLabel];
    [_assessImageView addSubview:_numberLabel];
    [_assessImageView addSubview:_progressView1];
    [_assessImageView addSubview:_progressView2];
    [_assessImageView addSubview:_progressView3];
    [_assessImageView addSubview:_progressView4];
    [_assessImageView addSubview:_progressView5];
    [_scrollView addSubview:_introduceLabel];
    [_scrollView addSubview:_actorScrollView];
    [_scrollView addSubview:_pictureScrollView];
    [_scrollView addSubview:_allLabel1];
    [_scrollView addSubview:_allLabel2];
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_titleLabel2];
    [_scrollView addSubview:_typeScrollView];
    [_typeScrollView addSubview:_includeLabel];
    [_scrollView addSubview:_shortCommitTableView];
    [self addSubview:_scrollView];
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
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
    }];
    _scrollView.scrollEnabled = YES;
    
    int width0 = 0.27 * width;
    int hight0 = 0.21 * hight;
    int left = 0.053 * width;
    int top = 0.105 * hight;
    [_moviewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.scrollView.mas_left).offset(10);
        make.top.equalTo(self.scrollView.mas_top).offset(0);
    }];
    
    
    _nameLabel.font = [UIFont systemFontOfSize:25];
    _nameLabel.text = _name;
    _nameLabel.numberOfLines = 0;
    _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [_nameLabel.text boundingRectWithSize:CGSizeMake(250, 600) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_nameLabel.font} context:nil].size;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(size.width+20));
        make.height.equalTo(@(size.height));
        make.left.equalTo(self.moviewImageView.mas_right).offset(15);
        make.top.equalTo(self.moviewImageView.mas_top).offset(0);
    }];
    _nameLabel.textColor = [UIColor whiteColor];
    
    
    _yearLabel.font = [UIFont systemFontOfSize:18];
    _yearLabel.numberOfLines = 0;
    _yearLabel.text = _year;
    CGSize sizeY = [_yearLabel.text boundingRectWithSize:CGSizeMake(230, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_yearLabel.font} context:nil].size;
    [_yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(sizeY.width + 20));
        make.height.equalTo(@(sizeY.height));
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
    }];
    _yearLabel.textColor = [UIColor whiteColor];
    
    _detailLabel.font = [UIFont systemFontOfSize:13];
    _detailLabel.text = _describe;;
    _detailLabel.numberOfLines = 0;
    CGSize sizeDetail = [_detailLabel.text boundingRectWithSize:CGSizeMake(220, 660) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_detailLabel.font} context:nil].size;
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(sizeDetail.width + 20));
        make.height.equalTo(@(sizeDetail.height + 10));
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
        make.top.equalTo(self.yearLabel.mas_bottom).offset(10);
    }];
    _detailLabel.textColor = [UIColor grayColor];
 
    width0 = 0.293 * width;
    hight0 = 0.06 * hight;
    _hadButton.contentMode = UIViewContentModeScaleAspectFill;
    
    _hadButton.clipsToBounds = YES;
    UIImage *image1 = [[UIImage imageNamed:@"had.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_hadButton setImage:image1 forState:UIControlStateNormal];
    [_hadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
        make.top.equalTo(self.detailLabel.mas_bottom).offset(20);
    }];
    UIImage *image = [[UIImage imageNamed:@"want.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _wantButton.contentMode = UIViewContentModeScaleAspectFill;
    
    _wantButton.clipsToBounds = YES;
    [_wantButton setImage:image forState:UIControlStateNormal];
    [_wantButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.hadButton.mas_right).offset(20);
        make.top.equalTo(self.hadButton.mas_top).offset(0);
    }];
    
    
    width0 = 0.92 * width;
    hight0 = 0.187 * hight;
    [_assessImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wantButton.mas_bottom).offset(30);
        make.left.equalTo(self.moviewImageView.mas_left).offset(0);
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
    }];
    _backImageVivew.image = [[UIImage imageNamed:@"assess.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _backImageVivew.contentMode = UIViewContentModeScaleAspectFill;
    
    _backImageVivew.clipsToBounds = YES;
    [_backImageVivew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.assessImageView.mas_width);
        make.height.equalTo(self.assessImageView.mas_height);
        make.left.equalTo(self.assessImageView.mas_left).offset(0);
        make.top.equalTo(self.assessImageView.mas_top).offset(0);
    }];
    
    
    
    width0 = 0.133 * width;
    left = 0.133 * width;
    top = 0.045 * hight;
    _gradeLabel.font = [UIFont systemFontOfSize:30];
    _gradeLabel.backgroundColor = [UIColor colorWithRed:0.29f green:0.36f blue:0.39f alpha:1.00f];
    _gradeLabel.textColor = [UIColor whiteColor];
    [_gradeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0 - 5));
        make.top.equalTo(self.assessImageView.mas_top).offset(top);
        make.left.equalTo(self.assessImageView.mas_left).offset(left);
    }];
    
    width0 = 0.38 * width + 20;
    hight0 = 0.1215 * hight;
    _hideLabel1.backgroundColor = [UIColor colorWithRed:0.29f green:0.36f blue:0.39f alpha:1.00f];
    [_hideLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.progressView1.mas_left).offset(-5);
        make.top.equalTo(self.assessImageView.mas_top).offset(1);
    }];
    
    width0 = 0.32 * width;
    hight0 = 0.03 * hight;
    _hideLabel2.backgroundColor = [UIColor colorWithRed:0.29f green:0.36f blue:0.39f alpha:1.00f];
    [_hideLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.assessImageView.mas_left).offset(0);
        make.top.equalTo(self.gradeLabel.mas_bottom).offset(0);
    }];
    
    left = 0.16 * width;
    width0 = 0.38 * width;
    hight0 =0.0075 * hight;
    _progressView1.backgroundColor = [UIColor colorWithRed:0.31f green:0.37f blue:0.41f alpha:1.00f];
    _progressView1.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left - 3);
        make.top.equalTo(self.gradeLabel.mas_top).offset(10);
    }];
    
    _progressView2.backgroundColor = [UIColor colorWithRed:0.33f green:0.39f blue:0.42f alpha:1.00f];
    _progressView2.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left - 3);
        make.top.equalTo(self.progressView1.mas_bottom).offset(2);
    }];

    _progressView3.backgroundColor = [UIColor colorWithRed:0.33f green:0.39f blue:0.42f alpha:1.00f];
    _progressView3.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left - 3);
        make.top.equalTo(self.progressView2.mas_bottom).offset(2);
    }];


    _progressView4.backgroundColor = [UIColor colorWithRed:0.33f green:0.39f blue:0.42f alpha:1.00f];
    _progressView4.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left - 3);
        make.top.equalTo(self.progressView3.mas_bottom).offset(2);
    }];


    _progressView5.backgroundColor = [UIColor colorWithRed:0.33f green:0.39f blue:0.42f alpha:1.00f];
    _progressView5.progressTintColor = [UIColor colorWithRed:0.97f green:0.66f blue:0.19f alpha:1.00f];
    [_progressView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.gradeLabel.mas_right).offset(left - 3);
        make.top.equalTo(self.progressView4.mas_bottom).offset(2);
    }];
    
    
    
    
    hight0 = 0.045 * hight;
    _typeScrollView.contentSize = CGSizeMake(width * 2, hight0);
    [_typeScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.scrollView.mas_left).offset(0);
        make.top.equalTo(self.assessImageView.mas_bottom).offset(20);
    }];
    
    width0 = 0.18 * width;
    hight0 = 0.045 * hight;
    _includeLabel.text = @"所属频道";
    _includeLabel.textColor = [UIColor colorWithRed:0.55f green:0.64f blue:0.67f alpha:1.00f];
    _includeLabel.font = [UIFont systemFontOfSize:15];
    [_includeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.typeScrollView.mas_left).offset(10);
        make.top.equalTo(self.typeScrollView.mas_top).offset(0);
    }];
 
    _introduceLabel.textColor = [UIColor whiteColor];
    _introduceLabel.font = [UIFont systemFontOfSize:15];
//    _introduceLabel.numberOfLines = 0;
    _introduceLabel.text = _introduceStr;
    NSLog(@"%@", _introduceStr);
    size = [_introduceLabel.text boundingRectWithSize:CGSizeMake(355, 400) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_introduceLabel.font} context:nil].size;
    NSLog(@"%@", _introduceLabel.text);
    width0 = 0.95 * width;
    hight0 = 0.21 *hight;
    if (_introduceLabel.numberOfLines == 6) {
        [_introduceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(hight0));
            make.left.equalTo(self.scrollView.mas_left).offset(10);
            make.top.equalTo(self.typeScrollView.mas_bottom).offset(30);
        }];
    } else {
        [_introduceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(size.width));
            make.height.equalTo(@(size.height + 20));
            make.left.equalTo(self.scrollView.mas_left).offset(10);
            make.top.equalTo(self.typeScrollView.mas_bottom).offset(30);
        }];
    }

    hight0 = 0.188 * hight;
    _actorScrollView.contentSize = CGSizeMake(width * 2, hight0);
    [_actorScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.scrollView.mas_left).offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
    }];
    
    hight0 = 0.037 * hight;
    _titleLabel.text = @"演职表";
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor whiteColor];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.introduceLabel.mas_left).offset(0);
        make.top.equalTo(self.introduceLabel.mas_bottom).offset(20);
    }];
    
    if (_setTableViewSize == YES) {
        width0 = 0.95 * width;
        [_shortCommitTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(self.scrollView.mas_height);
            make.left.equalTo(self.scrollView.mas_left).offset(10);
            make.top.equalTo(self.actorScrollView.mas_bottom).offset(10);
        }];
    }
    _shortCommitTableView.backgroundColor = [UIColor colorWithRed:0.29f green:0.36f blue:0.39f alpha:1.00f];
    
    
    _titleLabel2.text = @"预告片/剧照";
    
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
