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
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    _listTableView = [[UITableView alloc] init];
//    [_listTableView registerClass:[DBListTableViewCell class] forCellReuseIdentifier:@"ListCell"];
    [_scrollView addSubview:_listTableView];
    
//    _listTableView2 = [[UITableView alloc] init];
//    [_listTableView2 registerClass:[DBListTableViewCell class] forCellReuseIdentifier:@"ListCell2"];
//    [_scrollView addSubview:_listTableView2];
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
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        int h = self.frame.size.height;
        NSLog(@"%d", h);
        int h2 = 0.05 * hight;
        make.width.equalTo(@(width * 2));
        make.height.equalTo(@(h - h2));
        make.left.equalTo(self);
        make.top.equalTo(self).offset(h2);
    }];
    
    [_listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        int h = self.frame.size.height;
        NSLog(@"%d", h);
        int h2 = 0.05 * hight;
        make.width.equalTo(self);
        make.height.equalTo(@(h - h2));
        make.left.equalTo(self);
        make.top.equalTo(self).offset(h2);
    }];
    _listTableView.tag = 1;
    
//    [_listTableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        int h = self.frame.size.height;
//        NSLog(@"%d", h);
//        int h2 = 0.05 * hight;
//        make.width.equalTo(self);
//        make.height.equalTo(@(h - h2));
//        make.left.equalTo(self).offset(width);
//        make.top.equalTo(self).offset(h2);
//    }];
//    _listTableView2.tag = 2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
