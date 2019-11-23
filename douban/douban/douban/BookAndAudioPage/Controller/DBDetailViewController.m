//
//  DBDetailViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/18.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBDetailViewController.h"
#import "DBDetailView.h"
#import "Masonry.h"
#import "ShortCommitTableViewCell.h"
#import "SOZOChromoplast.h"

@interface DBDetailViewController ()
@property UILabel *nameLabel;
@property NSInteger width;
@property DBDetailView *detailView;
@property NSInteger hight;
@property NSMutableArray *touArray;
@property NSMutableArray *nameArray;
@property NSMutableArray *gradeArray;
@property NSMutableArray *commitArray;
@property NSMutableArray *timeArray;
@property NSMutableArray *zanArray;
@property BOOL select;
@property NSInteger sizeHight;
@end

@implementation DBDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       //设置返回按钮只保留箭头
    
    _touArray = [[NSMutableArray alloc] init];
    _nameArray = [[NSMutableArray alloc] init];
    _gradeArray = [[NSMutableArray alloc] init];
    _commitArray = [[NSMutableArray alloc] init];
    _zanArray = [[NSMutableArray alloc] init];
    _timeArray = [[NSMutableArray alloc] init];
    _select = YES;
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _hight = [UIScreen mainScreen].bounds.size.height;
    [self postDetail:_nowModel.listId];
    
    _detailView = [[DBDetailView alloc] init];
    _detailView.name = _nowModel.title;
    _detailView.year = _nowModel.year;
    _detailView.setTableViewSize = YES;

    _detailView.describe = @"";
    _detailView.describe = [_detailView.describe stringByAppendingString:@"/"];
    for (int i = 0; i < [_nowModel.countries count]; i++) {
        _detailView.describe = [_detailView.describe stringByAppendingString:_nowModel.countries[i]];
        _detailView.describe = [_detailView.describe stringByAppendingString:@" "];
    }
    _detailView.introduceStr = @" ";
    _detailView.describe = [_detailView.describe stringByAppendingString:@"/"];
    for (int i = 0; i < [_nowModel.genres count]; i++) {
        _detailView.describe = [_detailView.describe stringByAppendingString:_nowModel.genres[i]];
        _detailView.describe = [_detailView.describe stringByAppendingString:@" "];
    }
    _detailView.describe = [_detailView.describe stringByAppendingString:@"/"];
    [_detailView.describe stringByAppendingString:_nowModel.pubdates[[_nowModel.pubdates count] - 1]];
    for (int i = 0; i < [_nowModel.durations count]; i++) {
        _detailView.describe = [_detailView.describe stringByAppendingString:_nowModel.durations[i]];
        _detailView.describe = [_detailView.describe stringByAppendingString:@" "];
    }
//    _detailView.introduceStr =
    [_detailView layoutSubviews];
    
    int hight = [UIScreen mainScreen].bounds.size.height;
    int statusHight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    int h = self.navigationController.navigationBar.frame.size.height;
    int width = [UIScreen mainScreen].bounds.size.width;
    [self.view addSubview:_detailView];
    [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(@(hight - h - statusHight));
        make.left.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(h + statusHight);
    }];
    UIImage *image1 = [[UIImage imageNamed:@"had.PNG"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_detailView.wantButton setImage:image1 forState:UIControlStateNormal];

    
    NSString *str = _nowModel.images.medium;
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    _detailView.moviewImageView.image = image;
   
    _detailView.gradeLabel.text = _nowModel.rating.average;
    
    _detailView.scrollView.delegate = self;
    
    [_detailView.shortCommitTableView registerClass:[ShortCommitTableViewCell class] forCellReuseIdentifier:@"shortCommitCell"];
    _detailView.shortCommitTableView.delegate = self;
    _detailView.shortCommitTableView.dataSource = self;
    
    _detailView.shortCommitTableView.delegate = self;
    _detailView.shortCommitTableView.dataSource = self;
    // Do any additional setup after loading the view.
}
- (void)postDetail:(NSString*)idStr {
    [[DBDetailManger sharedMange]postData:^(DetailModel * _Nonnull returnModel) {
        self.detailModel = [[DetailModel alloc] init];
        self.detailModel = returnModel;
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self LoadData];
        });
    } id:idStr];
}
- (void)LoadData {
    NSLog(@"%@", self.nowModel.listId);
    NSLog(@"%@", self.detailModel.countries[0]);
    NSLog(@"%@", self.detailModel.rating.details.list1);
    
    
    NSLog(@"list1 = %@, transform = %f", self.detailModel.rating.details.list1, [self Transform:self.detailModel.rating.details.list1]);
    float sum = [self Transform:self.detailModel.rating.details.list1] + [self Transform:self.detailModel.rating.details.list2] +[self Transform:self.detailModel.rating.details.list3] + [self Transform:self.detailModel.rating.details.list4] + [self Transform:self.detailModel.rating.details.list5];
    _detailView.progressView1.progress = [self Transform:self.detailModel.rating.details.list5] / sum;
    NSLog(@"PROGRESS =  %f", [self Transform:self.detailModel.rating.details.list5] / sum * 100);
    NSLog(@"%f", _detailView.progressView1.progress);
    _detailView.progressView2.progress = [self Transform:self.detailModel.rating.details.list4] / sum;
    _detailView.progressView3.progress = [self Transform:self.detailModel.rating.details.list3] / sum;
    _detailView.progressView4.progress = [self Transform:self.detailModel.rating.details.list2] / sum;
    _detailView.progressView5.progress = [self Transform:self.detailModel.rating.details.list1] / sum;

    _detailView.introduceStr = [NSString stringWithFormat:@"剧情简介\n\n%@", _detailModel.summary];
    [_detailView layoutSubviews];
    _detailView.introduceLabel.numberOfLines = 6;
//    [_detailView layoutSubviews];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"展开" forState:UIControlStateNormal];
    [button setTintColor:[UIColor grayColor]];
    [_detailView.introduceLabel addSubview:button];
    int width0 = 0.1 * _width;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width0));
        make.height.equalTo(@(width0));
        make.right.equalTo(self.detailView.introduceLabel.mas_right).offset(0);
        make.bottom.equalTo(self.detailView.introduceLabel.mas_bottom).offset(15);
    }];
    [_detailView.introduceLabel setUserInteractionEnabled:YES];
    [button addTarget:self action:@selector(ClickPressOpen:) forControlEvents:UIControlEventTouchUpInside];
    
    int left;
    float temp = 0;
    NSInteger t;
    if ([_detailModel.tags count] >= 8) {
        t = 8;
    } else {
        t = [_detailModel.tags count];
    }
    for (int i = 0; i < t; i++) {
        left = 0.18 * _width + temp + 20;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_detailView.typeScrollView addSubview:btn];
        [btn setTitle:_detailModel.tags[i] forState:UIControlStateNormal];
        CGSize sizeY = [btn.titleLabel.text boundingRectWithSize:CGSizeMake(230, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil].size;
        btn.tintColor = [UIColor whiteColor];
        [btn setBackgroundColor:[UIColor colorWithRed:0.24f green:0.35f blue:0.40f alpha:1.00f]];

        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = (sizeY.height + 10) / 2;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(sizeY.width + 30));
            make.height.equalTo(@(sizeY.height + 10));
            make.left.equalTo(self.detailView.typeScrollView.mas_left).offset(left);
            make.top.equalTo(self.detailView.typeScrollView.mas_top).offset(0);
        }];
        temp = temp + sizeY.width + 10 + 30;
    }
    
    
    width0 = 0.213 * _width;
    int hight0 = 0.165 * _hight;
    if ([_detailModel.directors count] + [_detailModel.casts count] > 8) {
        t = 8;
    } else {
        t = [_detailModel.directors count] + [_detailModel.casts count];
    }
    temp = 10;
    for (int i = 0; i < [_detailModel.directors count]; i++) {
        temp = i * (width0 + 10) + 10;
        UIImageView *imageView = [[UIImageView alloc] init];
        Directors1Model *director = _detailModel.directors[i];
        Avatars1Model *avatar = director.avatars;
        NSString *str = avatar.medium;
        NSURL *url = [NSURL URLWithString:str];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        imageView.image = image;
        [_detailView.actorScrollView addSubview:imageView];
        NSLog(@"%d, %ld, %d", hight0, (long)_hight, width0);
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(hight0));
            make.left.equalTo(self.detailView.actorScrollView.mas_left).offset(temp);
            make.top.equalTo(self.detailView.actorScrollView.mas_top).offset(0);
        }];
    }
    for (int i = 0; i < t - [_detailModel.directors count]; i++) {
        temp = [_detailModel.directors count] * (width0 + 10) + 10 + i * (width0 + 10);
        UIImageView *imageView = [[UIImageView alloc] init];
        Casts1Model *cast = _detailModel.casts[i];
        Avatars1Model *avatar = cast.avatars;
        NSString *str = avatar.medium;
        NSURL *url = [NSURL URLWithString:str];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        imageView.image = image;
        [_detailView.actorScrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(hight0));
            make.left.equalTo(self.detailView.actorScrollView.mas_left).offset(temp);
            make.top.equalTo(self.detailView.actorScrollView.mas_top).offset(0);
        }];
    }
    
    float grade = [self Transform: _nowModel.rating.average];
    int width = [UIScreen mainScreen].bounds.size.width;
    width0 = 0.03 * width;
    for (int i = 0; i <= 4; i++) {
        UIImageView *imageView0 = [[UIImageView alloc] init];
        [_detailView addSubview:imageView0];
        [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(@(width0));
            make.left.equalTo(self.detailView.gradeLabel.mas_left).offset(width0 * i - 2);
            make.top.equalTo(self.detailView.gradeLabel.mas_bottom).offset(-2);
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
    
    if ([_detailModel.popular_comments count] >= 8) {
        t = 8;
    } else {
        t = [_detailModel.popular_comments count];
    }
    for (int i = 0; i < t; i++) {
        CommentModel *commit = _detailModel.popular_comments[i];
        AuthorModel *author = commit.author;
        NSString *str = author.avatar;
        
        [_touArray addObject:str];
        [_nameArray addObject:author.name];
        [_gradeArray addObject:commit.rating.value];
        [_timeArray addObject:commit.created_at];
        [_zanArray addObject:commit.useful_count];
        [_commitArray addObject:commit.content];
    }
    
    _detailView.setTableViewSize = NO;
    [_detailView.shortCommitTableView reloadData];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger t;
    if ([_detailModel.popular_comments count] >= 8) {
        t = 8;
    } else {
        t = [_detailModel.popular_comments count];
    }
    return t;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShortCommitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shortCommitCell" forIndexPath:indexPath];
    if ([_timeArray count] == 0) {
        return cell;
    }
    if (indexPath.row == 0) {
        _sizeHight = 0;
    }
    cell.tag = 0;
    cell.backgroundColor = [UIColor colorWithRed:0.29f green:0.36f blue:0.39f alpha:1.00f];
    NSString *str = _touArray[indexPath.row];
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.touImageView.image = image;
    cell.nameLabel.text = _nameArray[indexPath.row];
    
    float grade = [self Transform:_gradeArray[indexPath.row]];
    int width0 = 0.03 * _width;
    [cell.starImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
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
    cell.commitLabel.text = _commitArray[indexPath.row];
    cell.commitLabel.numberOfLines = 6;
    cell.commitLabel.font = [UIFont systemFontOfSize:15];
    cell.commitLabel.textColor = [UIColor whiteColor];
    CGSize size = [cell.commitLabel.text boundingRectWithSize:CGSizeMake(340, 600) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:cell.commitLabel.font} context:nil].size;
    if (size.height > 0.17 * _hight) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [cell addSubview:button];
        [button addTarget:self action:@selector(CellPressClickOpen:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"展开" forState:UIControlStateNormal];
        button.tintColor = [UIColor grayColor];
        
        [cell.commitLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.width - 20));
            make.height.equalTo(@(0.17 * self.hight));
        }];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(50));
            make.height.equalTo(@(20));
            make.bottom.equalTo(cell.commitLabel.mas_bottom).offset(15);
            make.right.equalTo(cell.commitLabel.mas_right).offset(8);
        }];
        _sizeHight += 0.33 * self.hight;
        if (indexPath.row  == [_touArray count] - 1) {
            [_detailView.shortCommitTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(self.width - 20));
                make.height.equalTo(@(self.sizeHight + 20));
                make.left.equalTo(self.detailView.scrollView.mas_left).offset(10);
                make.top.equalTo(self.detailView.actorScrollView.mas_bottom).offset(10);
            }];
        }
    } else {
        [cell.commitLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(size.width + 5));
            make.height.equalTo(@(size.height + 5));
        }];
        _sizeHight += size.height + 0.16 * _hight;
        if (indexPath.row  == [_touArray count] - 1) {
            [_detailView.shortCommitTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(self.width - 20));
                make.height.equalTo(@(self.sizeHight + 20));
                make.left.equalTo(self.detailView.scrollView.mas_left).offset(10);
                make.top.equalTo(self.detailView.actorScrollView.mas_bottom).offset(10);
            }];
        }
    }
    [cell.numberButton setTitle:_zanArray[indexPath.row] forState:UIControlStateNormal];
    cell.timeLabel.text = _timeArray[indexPath.row];
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UILabel *label = [[UILabel alloc] init];
    label.text = _commitArray[indexPath.row];
    label.font = [UIFont systemFontOfSize:15];
    label.numberOfLines = 6;
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(340, 600) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
    if ((size.height > 0.17 * _hight) && ([_detailView.shortCommitTableView cellForRowAtIndexPath:indexPath].tag != 1)) {
        return 0.33 * _hight;
    } else {
        return size.height + 0.16 * _hight;
    }
    
}
    

- (void)CellPressClickOpen:(UIButton*)btn {
    CGPoint point = btn.center;
    point = [_detailView.shortCommitTableView convertPoint:point fromView:btn.superview];
    NSIndexPath *indexpath = [_detailView.shortCommitTableView indexPathForRowAtPoint:point];
    ShortCommitTableViewCell *cell = [_detailView.shortCommitTableView cellForRowAtIndexPath:indexpath];
    cell.commitLabel.numberOfLines = 0;
    CGSize size = [cell.commitLabel.text boundingRectWithSize:CGSizeMake(340, 600) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:cell.commitLabel.font} context:nil].size;
    [cell.commitLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(size.width));
        make.height.equalTo(@(size.height));
    }];
    cell.tag = 1;
    [btn removeFromSuperview];
    [_detailView.shortCommitTableView beginUpdates];
    [_detailView.shortCommitTableView endUpdates];
    self.sizeHight = self.sizeHight + (size.height - 0.17 * _hight);
    [_detailView.shortCommitTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.width - 20));
        make.height.equalTo(@(self.sizeHight + 20));
        make.left.equalTo(self.detailView.scrollView.mas_left).offset(10);
        make.top.equalTo(self.detailView.actorScrollView.mas_bottom).offset(10);
    }];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    NSString *str = _nowModel.images.medium;
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *someImage = [UIImage imageWithData:data];
    SOZOChromoplast *chromoplast = [[SOZOChromoplast alloc] initWithImage:someImage];
    self.view.backgroundColor = chromoplast.firstHighlight;
    NSLog(@"%@", self.view.backgroundColor);
    if (self.view.backgroundColor == [UIColor blackColor]) {
        self.view.backgroundColor = chromoplast.dominantColor;
    }
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.topItem.title = @"";

    self.title = @"电影";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor]; //设置颜色
}

- (void)ClickPressOpen: (UIButton*)btn {
    [btn removeFromSuperview];
    _detailView.introduceLabel.numberOfLines = 0;
    [_detailView layoutSubviews];
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
            sum = sum * k + (int)[str characterAtIndex:i] - 48;
        } else {
            sum = sum + k * ((int)[str characterAtIndex:i] - 48);
        }
        NSLog(@"end = %f", sum);
    }
    NSLog(@"end = %f", sum);
    return sum;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
