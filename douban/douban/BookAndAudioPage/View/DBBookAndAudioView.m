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
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    UITextField *searchTextField = [[UITextField alloc] init];
    [self addSubview:searchTextField];
    searchTextField.placeholder = @"电影番剧小组";
    searchTextField.textAlignment = NSTextAlignmentCenter;
    searchTextField.backgroundColor = [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
    [searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        int hight0 = 0.05 * hight;
        int topOff = 0.04 * hight;
        int leftOff = 0.02 * hight;
        make.width.equalTo(self).multipliedBy(0.8);
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(topOff);
        make.left.equalTo(self).offset(leftOff);
    }];
    searchTextField.layer.masksToBounds = YES;
    searchTextField.layer.cornerRadius = 0.02 * hight;
    UIImageView *searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    [searchTextField addSubview:searchImageView];
    [searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        int width0 = 0.04 * width;
        int off = 0.027 * width;
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.top.equalTo(searchTextField).offset(off);
        make.left.equalTo(searchTextField).offset(off);
    }];
    
    UIImageView *codeImaegView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code"]];
    [searchTextField addSubview:codeImaegView];
    [codeImaegView mas_makeConstraints:^(MASConstraintMaker *make) {
        int width0 = 0.04 * width;
        int off = 0.027 * width;
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.top.equalTo(searchTextField).offset(off);
        make.right.equalTo(searchTextField).offset(-off);
    }];
    
    UIImageView *mailImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mail"]];
    [self addSubview:mailImageView];
    [mailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        NSLog(@"%f", searchTextField.frame.size.width);
        int width0 = 0.06 * width;
        int off = 0.027 * width;
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.top.equalTo(searchTextField).offset(off - 5);
        make.right.equalTo(self).offset(-off * 2);
    }];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"电影", @"电视", @"读书", @"原创小说", @"音乐", @"同城", nil];
    for (int i = 1; i <= 6; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:array[i - 1] forState:UIControlStateNormal];
        [self addSubview:btn];
        [btn setTintColor:[UIColor blackColor]];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        if (i == 1) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
        int hight0 = 0.045 * hight;
        int width0;
        int off;
        int top = 0.105 * hight;
        if (i != 4) {
            width0 = 0.152 * width;
        } else {
            width0 = 0.32 * width;
        }
        if (i <= 4) {
            off = (i - 1) * width * 0.152;
        } else {
            off = 0.72 * width + (i - 5) * width * 0.152;
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(hight0));
            make.top.equalTo(self).offset(top);
            make.left.equalTo(self).offset(off);
        }];
    }
    
    UISegmentedControl *segmentController = [[UISegmentedControl alloc] init];
    [self addSubview:segmentController];
    [segmentController insertSegmentWithTitle:@"影院热映" atIndex:0 animated:nil];
    [segmentController insertSegmentWithTitle:@"即将上映" atIndex:1 animated:nil];
    segmentController.layer.borderWidth = 0.0;
    segmentController.momentary = NO;
    segmentController.selectedSegmentIndex = 0;
    segmentController.tintColor = [UIColor clearColor];
    segmentController.layer.borderColor = [UIColor clearColor].CGColor;
//    segmentController.backgroundColor = [UIColor clearColor];
    [segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}forState:UIControlStateNormal];
    [segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}forState:UIControlStateSelected];
//    [segmentController setTitleTextAttributes:@{NSBackgroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    UIFont *font = [UIFont boldSystemFontOfSize:23];   // 设置字体大小
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:NSFontAttributeName];
    [segmentController setTitleTextAttributes:attributes
                                        forState:UIControlStateNormal];
    [segmentController mas_makeConstraints:^(MASConstraintMaker *make) {
        int hight0 = 0.15 * hight;
        int top = 0.165 * hight;
        make.width.equalTo(self).multipliedBy(0.587);
        make.height.equalTo(@(hight0));
        make.top.equalTo(self).offset(top);
        make.left.equalTo(self);
    }];
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
