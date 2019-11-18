//
//  DBListTableViewCell.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/18.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBListTableViewCell.h"
#import "Masonry.h"

@implementation DBListTableViewCell
/*140*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.movieImageView = [[UIImageView alloc] init];
    self.nameLabel = [[UILabel alloc] init];
    self.gradeLabel = [[UILabel alloc] init];
    self.detailLabel = [[UILabel alloc] init];
    self.buyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.numberLabel = [[UILabel alloc] init];
    self.starImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.movieImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.gradeLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.buyButton];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.starImageView];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int width0 = 0.213 * width;
    int hight0 = 0.172 * hight;
    int top = 0.03 * hight;
    int left = 0.04 * width;

    [_movieImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self).offset(left);
    }];

    width0 = width * 0.48;
    hight0 = hight * 0.03;
    left = 0.024 * width;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.movieImageView.mas_right).offset(top);
        make.top.equalTo(self.movieImageView.mas_top);
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
    }];
    _nameLabel.font = [UIFont systemFontOfSize:18];
    _nameLabel.textColor = [UIColor blackColor];

    hight0 = 0.015 * hight;
    left = 0.216 * width;
    [_gradeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.movieImageView.mas_right).offset(left);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(hight0);
        make.width.equalTo(@(50));
        make.height.equalTo(@(hight0));
    }];
    _gradeLabel.textColor = [UIColor grayColor];
    _gradeLabel.font = [UIFont systemFontOfSize:15];

    /*72 9-81*/
    width0 = 0.192 * width;
    [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.width.equalTo(@(width0));
        make.height.equalTo(self.gradeLabel.mas_height);
        make.top.equalTo(self.gradeLabel.mas_top);
    }];
    
    
    
    width0 = 0.426 * width;
    hight0 = 0.09 *hight;
    top = 0.015 * hight;
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.gradeLabel.mas_bottom).offset(top);
    }];
    _detailLabel.numberOfLines = 0;
    _detailLabel.textColor = [UIColor grayColor];
    _detailLabel.font = [UIFont systemFontOfSize:12];

    width0 = 0.16 * width;
    hight0 = 0.045 * hight;
    left = 0.04 * width;
    top = 0.075 * hight;
    [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.right.equalTo(self).offset(-left);
        make.top.equalTo(self).offset(top);
    }];
    _buyButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buyButton.layer.masksToBounds = YES;
    _buyButton.layer.cornerRadius = 5;
    _buyButton.layer.borderWidth = 1.0;
    _buyButton.layer.borderColor = [UIColor colorWithRed:0.94f green:0.39f blue:0.46f alpha:1.00f].CGColor;
    _buyButton.tintColor = [UIColor colorWithRed:0.94f green:0.39f blue:0.46f alpha:1.00f];

    hight0 = 0.017 * hight;
    top = 0.007 * hight;
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.buyButton.mas_bottom).offset(top);
        make.left.equalTo(self.buyButton);
    }];
    _numberLabel.textColor = [UIColor grayColor];
    _numberLabel.font = [UIFont systemFontOfSize:15];
    _numberLabel.textAlignment = NSTextAlignmentCenter;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
