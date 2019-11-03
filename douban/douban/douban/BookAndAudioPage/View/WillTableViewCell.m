//
//  WillTableViewCell.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/11/2.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "WillTableViewCell.h"
#import "Masonry.h"
@implementation WillTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.btn1 = [[UIButton alloc] init];
    self.btn2 = [[UIButton alloc] init];
    self.btn3 = [[UIButton alloc] init];
    self.nameLabel1 = [[UILabel alloc] init];
    self.nameLabel2 = [[UILabel alloc] init];
    self.nameLabel3 = [[UILabel alloc] init];
    self.wantLabel1 = [[UILabel alloc] init];
    self.wantLabel2 = [[UILabel alloc] init];
    self.wantLabel3 = [[UILabel alloc] init];
    self.dataButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.dataButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.dataButton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.contentView addSubview:self.btn1];
    [self.contentView addSubview:self.btn2];
    [self.contentView addSubview:self.btn3];
    [self.contentView addSubview:self.nameLabel1];
    [self.contentView addSubview:self.nameLabel2];
    [self.contentView addSubview:self.nameLabel3];
    [self.contentView addSubview:self.wantLabel1];
    [self.contentView addSubview:self.wantLabel2];
    [self.contentView addSubview:self.wantLabel3];
    [self.contentView addSubview:self.dataButton1];
    [self.contentView addSubview:self.dataButton2];
    [self.contentView addSubview:self.dataButton3];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int width0 = 0.28 * width;
    int hight0 = 0.24 * hight;
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
    [self.btn3 addTarget:self action:@selector(ClickPressEnterDetail:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    hight0 = 0.009 * hight;
    [_wantLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.nameLabel1.mas_width);
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel1.mas_left).offset(0);
        make.top.equalTo(self.nameLabel1.mas_bottom).offset(0);
    }];
    _wantLabel1.textColor = [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f];
    _wantLabel1.font = [UIFont systemFontOfSize:15];
    
    [_wantLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.nameLabel2.mas_width);
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel2.mas_left).offset(0);
        make.top.equalTo(self.nameLabel2.mas_bottom).offset(0);
    }];
    _wantLabel2.textColor = [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f];
    _wantLabel2.font = [UIFont systemFontOfSize:15];
    
    [_wantLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.nameLabel3.mas_width);
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel3.mas_left).offset(0);
        make.top.equalTo(self.nameLabel3.mas_bottom).offset(0);
    }];
    _wantLabel3.textColor = [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f];
    _wantLabel3.font = [UIFont systemFontOfSize:15];
    
    width0 = 0.133 * width;
    hight0 = 0.027 * hight;
    top = 0.004 * hight;
    [_dataButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel1.mas_left).offset(0);
        make.top.equalTo(self.wantLabel1.mas_bottom).offset(top);
    }];
    [_dataButton1 setTintColor:[UIColor colorWithRed:0.94f green:0.40f blue:0.47f alpha:1.00f]];
    _dataButton1.layer.masksToBounds = YES;
    _dataButton1.layer.borderWidth = 1.0;
    _dataButton1.layer.cornerRadius = 1.0;
    _dataButton1.titleLabel.textAlignment = NSTextAlignmentCenter;
    _dataButton1.layer.borderColor = [UIColor colorWithRed:0.94f green:0.40f blue:0.47f alpha:1.00f].CGColor;
    
    [_dataButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel2.mas_left).offset(0);
        make.top.equalTo(self.wantLabel2.mas_bottom).offset(top);
    }];
    [_dataButton2 setTintColor:[UIColor colorWithRed:0.94f green:0.40f blue:0.47f alpha:1.00f]];
    _dataButton2.layer.masksToBounds = YES;
    _dataButton2.layer.borderWidth = 1.0;
    _dataButton2.layer.cornerRadius = 1.0;
    _dataButton2.layer.borderColor = [UIColor colorWithRed:0.94f green:0.40f blue:0.47f alpha:1.00f].CGColor;

    
    [_dataButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(hight0));
        make.left.equalTo(self.nameLabel3.mas_left).offset(0);
        make.top.equalTo(self.wantLabel3.mas_bottom).offset(top);
    }];
    [_dataButton3 setTintColor:[UIColor colorWithRed:0.94f green:0.40f blue:0.47f alpha:1.00f]];
    _dataButton3.layer.masksToBounds = YES;
    _dataButton3.layer.borderWidth = 1.0;
    _dataButton3.layer.cornerRadius = 1.0;
    _dataButton3.layer.borderColor = [UIColor colorWithRed:0.94f green:0.40f blue:0.47f alpha:1.00f].CGColor;
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
