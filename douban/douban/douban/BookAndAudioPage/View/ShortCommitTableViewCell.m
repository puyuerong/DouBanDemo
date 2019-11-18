//
//  ShortCommitTableViewCell.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/11/17.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "ShortCommitTableViewCell.h"
#import "Masonry.h"
@implementation ShortCommitTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _touImageView = [[UIImageView alloc] init];
    _nameLabel = [[UILabel alloc] init];
    _commitLabel = [[UILabel alloc] init];
    _timeLabel = [[UILabel alloc] init];
    _zanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _starImageView = [[UIImageView alloc] init];
    [self addSubview:_touImageView];
    [self addSubview:_nameLabel];
    [self addSubview:_starImageView];
    [self addSubview:_timeLabel];
    [self addSubview:_commitLabel];
    [self addSubview:_zanButton];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int width0 = 0.107 * width;
    [_touImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(10);
    }];
    _touImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _touImageView.clipsToBounds = YES;
    
    _touImageView.layer.masksToBounds = YES;
    _touImageView.layer.cornerRadius = width0 / 2;
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(250));
        make.height.equalTo(@(width0 / 2));
        make.left.equalTo(self.touImageView.mas_right).offset(5);
        make.top.equalTo(self.touImageView.mas_top).offset(0);
    }];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    
    
    width0 = 0.186 * width;
    int hight0 = 0.0105 * hight;
    [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(4);
    }];
    
    width0 = 0.187 * width;
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.starImageView.mas_right).offset(5);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(4);
    }];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    
    [_commitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.touImageView.mas_left).offset(0);
        make.top.equalTo(self.touImageView.mas_bottom).offset(15);
    }];
    _commitLabel.font = [UIFont systemFontOfSize:15];
    _commitLabel.textColor = [UIColor whiteColor];
    _commitLabel.numberOfLines = 0;
    
    
    
    
    width0 = 0.107 * width;
    hight0 = 0.03 * hight;
    [_zanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(hight0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.touImageView.mas_left).offset(0);
        make.top.equalTo(self.commitLabel.mas_bottom).offset(10);
    }];
    _zanButton.tintColor = [UIColor grayColor];
    _zanButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_zanButton setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
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
