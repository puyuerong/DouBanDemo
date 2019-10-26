//
//  DBMainTableViewCell.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/13.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBMainTableViewCell.h"
#import "Masonry.h"
@implementation DBMainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.btn1 = [[UIButton alloc] init];
    self.btn2 = [[UIButton alloc] init];
    self.btn3 = [[UIButton alloc] init];
    self.nameLabel1 = [[UILabel alloc] init];
    self.nameLabel2 = [[UILabel alloc] init];
    self.nameLabel3 = [[UILabel alloc] init];
    self.gradeLabel1 = [[UILabel alloc] init];
    self.gradeLabel2 = [[UILabel alloc] init];
    self.gradeLabel3 = [[UILabel alloc] init];
    self.starImageView1 = [[UIImageView alloc] init];
    self.starImageView2 = [[UIImageView alloc] init];
    self.starImageView3 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.btn1];
    [self.contentView addSubview:self.btn2];
    [self.contentView addSubview:self.btn3];
    [self.contentView addSubview:self.nameLabel1];
    [self.contentView addSubview:self.nameLabel2];
    [self.contentView addSubview:self.nameLabel3];
    [self.contentView addSubview:self.gradeLabel1];
    [self.contentView addSubview:self.gradeLabel2];
    [self.contentView addSubview:self.gradeLabel3];
    [self.contentView addSubview:self.starImageView1];
    [self.contentView addSubview:self.starImageView2];
    [self.contentView addSubview:self.starImageView3];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int width0 = 0.28 * width;
    int hight0 = 0.225 * hight;
    int top = 0.03 * hight;
    int left = 0.04 * width;
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self).offset(left);
    }];
    [self.btn1 addTarget:self action:@selector(ClickPressEnterDetail:) forControlEvents:UIControlEventTouchUpInside];

    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self.btn1.mas_right).offset(left);
    }];
    [self.btn2 addTarget:self action:@selector(ClickPressEnterDetail:) forControlEvents:UIControlEventTouchUpInside];

    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        NSLog(@"%@", self.btn1.mas_bottom);
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self.btn2.mas_right).offset(left);
    }];
    [self.btn1 addTarget:self action:@selector(ClickPressEnterDetail:) forControlEvents:UIControlEventTouchUpInside];
    
    hight0 = 0.045 * hight;
    [self.nameLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.equalTo(self.btn1.mas_left);
    }];
    _nameLabel1.font = [UIFont systemFontOfSize:17];

    [self.nameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.btn2.mas_bottom);
        make.left.equalTo(self.btn2.mas_left);
    }];
    _nameLabel2.font = [UIFont systemFontOfSize:17];

    [self.nameLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.btn3.mas_bottom);
        make.left.equalTo(self.btn3.mas_left);
    }];
    _nameLabel3.font = [UIFont systemFontOfSize:17];
    
    width0 = 0.133 * width;
    hight0 = 0.022 * hight;
    left = 0.16 * width;
    [self.gradeLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.nameLabel1.mas_bottom);
        make.left.equalTo(self.btn1).offset(left);
    }];
    _gradeLabel1.font = [UIFont systemFontOfSize:15];
    _gradeLabel1.textColor = [UIColor grayColor];

    [self.gradeLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.nameLabel2.mas_bottom);
        make.left.equalTo(self.btn2).offset(left);
    }];
    _gradeLabel2.font = [UIFont systemFontOfSize:15];
    _gradeLabel2.textColor = [UIColor grayColor];

    [self.gradeLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self.nameLabel3.mas_bottom);
        make.left.equalTo(self.btn3).offset(left);
    }];
    _gradeLabel3.font = [UIFont systemFontOfSize:15];
    _gradeLabel3.textColor = [UIColor grayColor];

    /*15-60 = 45*/
    width0 = 0.16 * width;
    [_starImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gradeLabel1.mas_top);
        make.left.equalTo(self.nameLabel1.mas_left);
        make.height.equalTo(self.gradeLabel1.mas_height);
        make.width.equalTo(@(width0));
    }];
    [_starImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gradeLabel2.mas_top);
        make.left.equalTo(self.nameLabel2.mas_left);
        make.height.equalTo(self.gradeLabel2.mas_height);
        make.width.equalTo(@(width0));
    }];
    [_starImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gradeLabel3.mas_top);
        make.left.equalTo(self.nameLabel3.mas_left);
        make.height.equalTo(self.gradeLabel3.mas_height);
        make.width.equalTo(@(width0));
    }];
}
- (void)ClickPressEnterDetail:(UIButton*)btn {
    [self.delegate ClickPressEnterDetail:btn];
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
