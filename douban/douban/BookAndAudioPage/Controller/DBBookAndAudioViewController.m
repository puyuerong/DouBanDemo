//
//  DBBookAndAudioViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/11.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBBookAndAudioViewController.h"
#import "DBListViewController.h"
#import "DBDetailViewController.h"
#import "Masonry.h"
#import "DBModel.h"
#import "DBManger.h"
@interface DBBookAndAudioViewController ()
@property DBNowModel *dataModel;
@property DBModel *allModel;
@property DBBookAndAudioView *bookAndAudioView;
@end

@implementation DBBookAndAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _titleArray = [[NSMutableArray alloc] init];
    _gradeArray = [[NSMutableArray alloc] init];
    [self postData];
    _bookAndAudioView = [[DBBookAndAudioView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_bookAndAudioView];
    _bookAndAudioView.delegate = self;
    
    _bookAndAudioView.movieTableView.delegate = self;
    _bookAndAudioView.movieTableView.dataSource = self;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)postData {
    [[DBManger sharedManger] postNowData:^(DBNowModel * _Nonnull resuleModel) {
        NSLog(@"请求成功");
        self.dataModel = [[DBNowModel alloc] init];
        self.dataModel = resuleModel;
    }];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    [cell.btn1 setImage:[UIImage imageNamed:@"roy3.JPG"] forState:UIControlStateNormal];
    cell.nameLabel1.text = _dataModel.title[0];
    cell.nameLabel2.text = @"沉睡魔咒";
    cell.nameLabel3.text = @"你好霸王龙";
    cell.gradeLabel1.text = @"7.1";
    float grade = [self Transform:cell.gradeLabel1.text];
    int width = [UIScreen mainScreen].bounds.size.width;
    int width0 = 0.028 * width;
    for (int i = 0; i <= 4; i++) {
        UIImageView *imageView0 = [[UIImageView alloc] init];
        [cell.starImageView1 addSubview:imageView0];
        [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(cell.starImageView1.mas_height);
            make.left.equalTo(cell.starImageView1.mas_left).offset(width0 * i);
            make.top.equalTo(cell.starImageView1.mas_top);
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
    cell.gradeLabel2.text = @"6.2";
    grade = [self Transform:cell.gradeLabel2.text];
    for (int i = 0; i <= 4; i++) {
        UIImageView *imageView0 = [[UIImageView alloc] init];
        [cell.starImageView2 addSubview:imageView0];
        [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(cell.starImageView2.mas_height);
            make.left.equalTo(cell.starImageView2.mas_left).offset(width0 * i);
            make.top.equalTo(cell.starImageView2.mas_top);
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
    cell.gradeLabel3.text = @"8.2";
    grade = [self Transform:cell.gradeLabel3.text];
    for (int i = 0; i <= 4; i++) {
        UIImageView *imageView0 = [[UIImageView alloc] init];
        [cell.starImageView1 addSubview:imageView0];
        [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(width0));
            make.height.equalTo(cell.starImageView3.mas_height);
            make.left.equalTo(cell.starImageView3.mas_left).offset(width0 * i);
            make.top.equalTo(cell.starImageView3.mas_top);
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
//    cell.delegate = self;
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
    return 220;
}



- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:nil];
}
- (void)ClickButton:(UIButton *)btn {
    DBListViewController *listViewContoller = [[DBListViewController alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:listViewContoller animated:YES];
}
//- (void)ClickPressEnterDetail:(UIButton *)btn {
//    DBDetailViewController *detailVC = [[DBDetailViewController alloc] init];
//    [self.navigationController pushViewController:detailVC animated:YES];
//}
- (void)ClickTableViewButton:(UIButton *)btn {
    DBDetailViewController *detailVC = [[DBDetailViewController alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:NO animated:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
