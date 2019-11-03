//
//  DBBookAndAudioView.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/12.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBBookAndAudioView.h"
#import "Masonry.h"

@implementation DBBookAndAudioView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    
    _searchTextField = [[UITextField alloc] init];
    [self addSubview:_searchTextField];
    
    _searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    [_searchTextField addSubview:_searchImageView];
    
    
    _codeImaegView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code"]];
    [_searchTextField addSubview:_codeImaegView];
    
    
    _mailImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mail"]];
    [self addSubview:_mailImageView];
    
    _btnArray = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 6; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:btn];
        [_btnArray addObject:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    _segmentController = [[UISegmentedControl alloc] init];
    [self addSubview:_segmentController];
    [_segmentController insertSegmentWithTitle:@"影院热映" atIndex:0 animated:nil];
    [_segmentController insertSegmentWithTitle:@"即将上映" atIndex:1 animated:nil];
    

    _allButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_allButton];
    
    _movieTableView = [[UITableView alloc] init];
//    [_movieTableView registerClass:[DBMainTableViewCell class] forCellReuseIdentifier:@"mainCell"];
    [_scrollView addSubview:_movieTableView];

    _movieTableView2 = [[UITableView alloc] init];
    _movieTableView2.backgroundColor = [UIColor redColor];
//    [_movieTableView2 registerClass:[DBMainTableViewCell class] forCellReuseIdentifier:@"mainCell2"];
    [_scrollView addSubview:_movieTableView2];
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    
    _searchTextField.placeholder = @"电影番剧小组";
    _searchTextField.textAlignment = NSTextAlignmentCenter;
    _searchTextField.backgroundColor = [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        int hight0 = 0.05 * hight;
        int topOff = 0.04 * hight;
        int leftOff = 0.02 * hight;
        make.width.equalTo(self).multipliedBy(0.8);
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(topOff);
        make.left.equalTo(self).offset(leftOff);
    }];
    _searchTextField.layer.masksToBounds = YES;
    _searchTextField.layer.cornerRadius = 0.02 * hight;
    
    [_searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        int width0 = 0.04 * width;
        int off = 0.027 * width;
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.top.equalTo(self.searchTextField).offset(off);
        make.left.equalTo(self.searchTextField).offset(off);
    }];
    
    [_mailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        int width0 = 0.06 * width;
        int off = 0.027 * width;
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.top.equalTo(self.searchTextField).offset(off - 5);
        make.right.equalTo(self).offset(-off * 2);
    }];
    
    [_codeImaegView mas_makeConstraints:^(MASConstraintMaker *make) {
        int width0 = 0.04 * width;
        int off = 0.027 * width;
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.top.equalTo(self.searchTextField).offset(off);
        make.right.equalTo(self.searchTextField).offset(-off);
    }];
    
    _segmentController.layer.borderWidth = 0.0;
    _segmentController.momentary = NO;
    _segmentController.selectedSegmentIndex = 0;
    _segmentController.tintColor = [UIColor clearColor];
    _segmentController.layer.borderColor = [UIColor clearColor].CGColor;

    [_segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont systemFontOfSize:20] }forState:UIControlStateNormal];
    [_segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:20]}forState:UIControlStateSelected];
    
    [_segmentController mas_makeConstraints:^(MASConstraintMaker *make) {
        int hight0 = 0.08 * hight; /*0.15*/
        int top = 0.165 * hight;
        make.width.equalTo(self).multipliedBy(0.587);
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self);
    }];
    [_segmentController addTarget:self action:@selector(ClickPressScroll:) forControlEvents:UIControlEventValueChanged];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"电影", @"电视", @"读书", @"原创小说", @"音乐", @"同城", nil];
    for (int i = 1; i <= 6; i++) {
        [_btnArray[i - 1] setTitle:array[i - 1] forState:UIControlStateNormal];
        [_btnArray[i - 1] setTintColor:[UIColor blackColor]];
        
        if (i == 1) {
            [_btnArray[i - 1] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        } else {
            [_btnArray[i - 1] setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
        int hight0 = 0.045 * hight;
        int width0;
        int off;
        int top = 0.105 * hight;
        if (i != 4) {
            width0 = 0.152 * width;
        } else {
            width0 = 0.3 * width;
        }
        if (i <= 4) {
            off = (i - 1) * width * 0.152;
        } else {
            off = 0.72 * width + (i - 5) * width * 0.152;
        }
        [_btnArray[i - 1] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(hight0));
            make.top.equalTo(self).offset(top);
            make.left.equalTo(self).offset(off);
        }];
    }
    
    [_allButton setTitle:@"全部71部 >" forState:UIControlStateNormal];
    [_allButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _allButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [_allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        int width0 = width * 0.413;
        make.height.equalTo(self.segmentController);
        make.width.equalTo(@(width0));
        make.top.equalTo(self.segmentController);
        make.right.equalTo(self);
    }];
    [_allButton addTarget:self action:@selector(PressClickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(self).multipliedBy(0.66);
        make.top.equalTo(self.segmentController.mas_bottom);
        make.left.equalTo(self);
    }];
    _scrollView.contentSize = CGSizeMake(width * 2, 0.66 * hight);
    
    [_movieTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(self).multipliedBy(0.65);
        make.top.equalTo(self.scrollView.mas_top).offset(0);
        make.left.equalTo(self.scrollView.mas_left).offset(0);
    }];
    _movieTableView.tag = 1;
    
    [_movieTableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(self).multipliedBy(0.65);
        make.top.equalTo(self.movieTableView.mas_top).offset(0);
        make.left.equalTo(self.movieTableView.mas_right).offset(0);
    }];
    _movieTableView2.tag = 2;
    
//    _scrollView.contentSize = CGSizeMake(width * 2, 0.65 * hight);
    NSLog(@"%d", width);
    
    
}

- (void)ClickPressScroll:(UISegmentedControl*)segmentControl {
    [_delegate ClickPressScroll:segmentControl];
}
- (void)PressClickButton:(UIButton*)btn {
    [_delegate ClickButton:btn];
}
- (void)ClickPressEnterDetail:(UIButton *)btn {
    [_delegate ClickTableViewButton:btn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
