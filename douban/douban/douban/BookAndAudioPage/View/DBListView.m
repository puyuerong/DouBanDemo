//
//  DBListView.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/17.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBListView.h"
#import "Masonry.h"
#import "DBListTableViewCell.h"
@implementation DBListView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
   
    _listTableView = [[UITableView alloc] init];
    [_listTableView registerClass:[DBListTableViewCell class] forCellReuseIdentifier:@"ListCell"];
    [self addSubview:_listTableView];
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    
    _segmentControl = [[UISegmentedControl alloc] init];
    [_segmentControl insertSegmentWithTitle:@"正在热映" atIndex:0 animated:YES];
    [_segmentControl insertSegmentWithTitle:@"即将上映" atIndex:1 animated:YES];
    [_segmentControl insertSegmentWithTitle:@"10月观影指南" atIndex:2 animated:YES];
    [self addSubview:_segmentControl];
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    
    [_segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        int hight0 = 0.05 * hight;
        make.width.equalTo(@(width));
        make.height.equalTo(@(hight0));
        make.top.equalTo(self);
        make.left.equalTo(self);
    }];
//    _segmentControl.tintColor = [UIColor clearColor];
    _segmentControl.momentary = NO;
    _segmentControl.selectedSegmentIndex = 0;
    _segmentControl.tintColor = [UIColor clearColor];
    _segmentControl.layer.borderColor = [UIColor clearColor].CGColor;
    [_segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
    [_segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    [_listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        int h = self.frame.size.height;
        NSLog(@"%d", h);
        int h2 = 0.05 * hight;
        make.width.equalTo(self);
        make.height.equalTo(@(h - h2));
        make.left.equalTo(self);
        make.top.equalTo(self).offset(h2);
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    cell.movieImageView.image = [UIImage imageNamed:@"roy3.JPG"];
    cell.nameLabel.text = @"双子杀手";
    cell.gradeLabel.text = @"7.1";
    float grade = [self Transform:cell.gradeLabel.text];
    int width = [UIScreen mainScreen].bounds.size.width;
    int width0 = 0.03 * width;
    for (int i = 0; i <= 4; i++) {
        UIImageView *imageView0 = [[UIImageView alloc] init];
        [cell.starImageView addSubview:imageView0];
        [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(cell.starImageView.mas_height);
            make.left.equalTo(cell.starImageView.mas_left).offset(width0 * i);
            make.top.equalTo(cell.starImageView.mas_top);
        }];
        if (grade - 2 < 0) {
            if (grade - 2 == -2) {
                imageView0.image = [UIImage imageNamed:@"emptyStar"];
            } else {
                imageView0.image = [UIImage imageNamed:@"halfStar"];
                grade = 0;
            }
        } else {
            imageView0.image = [UIImage imageNamed:@"allStar"];
            grade = grade - 2;
        }
    }
            
            
    cell.detailLabel.text = @"上映日期：2019年10月18日 导演：李安 主演：威尔·史密斯玛丽·伊... 类型：动作|科幻 地区：美国 中国大陆";
    [cell.buyButton setTitle:@"购票" forState:UIControlStateNormal];
    cell.numberLabel.text = @"2.1万人看过";
    return cell;
}
- (float)Transform:(NSString*)str {
    float k = 10, sum = 0, t = 1;
    for (int i = 0; i < [str length]; i++) {
        if ([str characterAtIndex:i] == '.') {
            k = 0.1;
            t = 0.1;
            continue;
        }
        if (k == 10) {
            sum = sum * t + (int)[str characterAtIndex:i] - 48;
            t = t * k;
        } else {
            sum = sum + t * ((float)[str characterAtIndex:i] - 48);
            t = t * k;
        }
    }
    NSLog(@"end = %f", sum);
    return sum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    int hight = [UIScreen mainScreen].bounds.size.height;
    return 0.217 * hight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_delegate ClickPressCell];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
