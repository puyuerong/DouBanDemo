//
//  DBListViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/17.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBListViewController.h"
#import "DBDetailViewController.h"

@interface DBListViewController ()
@property DBListView *listView;
@property NSMutableArray *imageArray;
@property NSMutableArray *nameArray;
@property NSMutableArray *gradeArray;
@property NSMutableArray *yearArray;
@property NSMutableArray *areaArray;
@property NSMutableArray *descripeArray;
@property NSMutableArray *peopleArray;
@property NSInteger width;
@property NSUInteger enterNumber;
@property DetailModel *senderModel;
@property NSString *selectId;
@end
/* 导航栏下划线去除*/
/*获取导航栏和状态栏高度*/
@implementation DBListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%ld", _select);
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    _width = [UIScreen mainScreen].bounds.size.width;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"院线电影";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStyleDone target:self action:@selector(ClickPressBack:)];
    [leftBarItem setTintColor:[UIColor blackColor]];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"西安^" style:UIBarButtonItemStyleDone target:self action:@selector(ClickPressEnter:)];
    [rightBarButtonItem setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    _imageArray = [[NSMutableArray alloc] init];
    _nameArray = [[NSMutableArray alloc] init];
    _gradeArray = [[NSMutableArray alloc] init];
    _descripeArray = [[NSMutableArray alloc] init];
    _peopleArray = [[NSMutableArray alloc] init];
    [self postData];
    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int nHight = self.navigationController.navigationBar.frame.size.height;
    int statusHight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    hight = hight - nHight - statusHight;
    _listView = [[DBListView alloc] init];
    [self.view addSubview:_listView];
//    _listView.segmentControl.selectedSegmentIndex = _select - 1;
    [_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        NSLog(@"%d", hight);
        make.width.equalTo(@(width));
        make.height.equalTo(@(hight));
        make.left.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(nHight + statusHight);
    }];
    
    [_listView.listTableView registerClass:[DBListTableViewCell class] forCellReuseIdentifier:@"ListCell"];
    _listView.listTableView.delegate = self;
    _listView.listTableView.dataSource = self;
    
    _listView.delegate = self;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:nil];
    _enterNumber = indexPath.row;
    DBDetailViewController *detailVC = [[DBDetailViewController alloc] init];
    detailVC.nowModel = [[DBNowModel alloc] init];
    detailVC.nowModel = _dataModel.subjects[_enterNumber];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentOffset.x > _width) {
        _listView.segmentControl.selectedSegmentIndex = 1;
    } else {
        _listView.segmentControl.selectedSegmentIndex = 0;
    }
}

- (void)postData {
    DBNowModel *nowModel = [[DBNowModel alloc] init];
    
    for (int i = 0; i < 10; i++) {
        if (_select == 1) {
            nowModel = _dataModel.subjects[i];
        } else {
            nowModel = _data2Model.subjects[i];
        }
        [self.imageArray addObject:nowModel.images.medium];
        [self.nameArray addObject:nowModel.title];
        [self.gradeArray addObject:nowModel.rating.average];
        NSString *str = [NSString stringWithFormat:@"%@/", nowModel.year];
        for (int j = 0; j < [nowModel.countries count]; j++) {
            str = [str stringByAppendingString:nowModel.countries[j]];
            str = [str stringByAppendingString:@" "];
        }
        str = [str stringByAppendingString:@"/"];
        for (int j = 0; j < [nowModel.genres count]; j++) {
            str = [str stringByAppendingString:nowModel.genres[j]];
            str = [str stringByAppendingString:@" "];
        }
        str = [str stringByAppendingString:@"/"];
        for (int j = 0; j < [nowModel.directors count]; j++) {
            DirectorsModel *dModel = nowModel.directors[j];
            str = [str stringByAppendingString:dModel.name];
            str = [str stringByAppendingString:@" "];
        }
        str = [str stringByAppendingString:@"/"];
        for (int j = 0; j < [nowModel.casts count]; j++) {
            CastsModel *castModel = nowModel.casts[j];
            str = [str stringByAppendingString:castModel.name];
            str = [str stringByAppendingString:@" "];
        }
        str = [str stringByAppendingString:@"/"];
        for (int j = 0; j < [nowModel.directors count]; j++) {
            DirectorsModel *directorsModel = nowModel.directors[j];
            str = [str stringByAppendingString:directorsModel.name];
        }
        [self.descripeArray addObject:str];
        [self.peopleArray addObject:nowModel.collect_count];
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    NSString *str = _imageArray[indexPath.row];
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.movieImageView.image = image;
    cell.nameLabel.text = _nameArray[indexPath.row];
    cell.gradeLabel.text = _gradeArray[indexPath.row];
    float grade = [self Transform:cell.gradeLabel.text];
    int width = [UIScreen mainScreen].bounds.size.width;
    int width0 = 0.03 * width;
    
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


    cell.detailLabel.text = _descripeArray[indexPath.row];
    [cell.buyButton setTitle:@"购票" forState:UIControlStateNormal];
    cell.numberLabel.text = _peopleArray[indexPath.row];
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

- (void)ClickPressBack:(UIButton*)btn {
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)ClickPressEnter:(UIButton*)btn {
    DBNothingViewController *nothingVC = [[DBNothingViewController alloc] init];
    [self.navigationController pushViewController:nothingVC animated:YES];
}
- (void)ClickPressCell {
    DBDetailViewController *detailVC = [[DBDetailViewController alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:NO animated:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}

    
/*
#pragma mark - Navigation

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

@end
