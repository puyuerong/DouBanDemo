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
@property NSInteger width;
@end

@implementation DBBookAndAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _width = [UIScreen mainScreen].bounds.size.width;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _titleArray1 = [[NSMutableArray alloc] init];
    _gradeArray1 = [[NSMutableArray alloc] init];
    _imageArray1 = [[NSMutableArray alloc] init];
    _titleArray2 = [[NSMutableArray alloc] init];
    _gradeArray2 = [[NSMutableArray alloc] init];
    _imageArray2 = [[NSMutableArray alloc] init];
    [self postDataType:@"now"];

    _bookAndAudioView = [[DBBookAndAudioView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_bookAndAudioView];
    _bookAndAudioView.delegate = self;
    
    _bookAndAudioView.movieTableView.delegate = self;
    _bookAndAudioView.movieTableView.dataSource = self;
    _bookAndAudioView.movieTableView2.delegate = self;
    _bookAndAudioView.movieTableView2.dataSource = self;
    
    _bookAndAudioView.scrollView.delegate = self;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > _width) {
        if ([_titleArray2 count] == 0) {
            [self postDataType:@"will"];
        }
        _bookAndAudioView.segmentController.selectedSegmentIndex = 1;
    } else {
        _bookAndAudioView.segmentController.selectedSegmentIndex = 0;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)postDataType:(NSString*)select {
    [[DBManger sharedManger] postNowData:^(DBModel * _Nonnull resuleModel, NSInteger i) {
        NSLog(@"请求成功");
        self.allModel = [[DBModel alloc] init];
        self.allModel = resuleModel;
        self.dataModel = [[DBNowModel alloc] init];
        
        for (int j = 0; j < i; j++) {
            self.dataModel = resuleModel.subjects[j];
            if ([select isEqualToString:@"now"]) {
                [self.titleArray1 addObject:self.dataModel.title];
                [self.gradeArray1 addObject:self.dataModel.rating.average];
                [self.imageArray1 addObject:self.dataModel.images.medium];
            } else {
                [self.titleArray2 addObject:self.dataModel.title];
                [self.gradeArray2 addObject:self.dataModel.rating.average];
                [self.imageArray2 addObject:self.dataModel.images.medium];
            }
        }
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            if ([select isEqualToString:@"now"]) {
//                [self.bookAndAudioView.movieTableView reloadData];
//            } else {
//                [self.bookAndAudioView.movieTableView2 reloadData];
//            }
//        }];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([select isEqualToString:@"now"]) {
                [self.bookAndAudioView.movieTableView reloadData];
            } else {
                [self.bookAndAudioView.movieTableView2 reloadData];
            }
        });
    } type:select];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (tableView.tag == 1) {
        DBMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
        if ([self.titleArray1 count] == 0) {
            return cell;
        }
        NSString *str1 = _imageArray1[indexPath.row * 3];
        NSLog(@"%@", str1);
        NSURL *url1 = [NSURL URLWithString:str1];
        NSLog(@"url1 = %@", url1);
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        NSLog(@"data1 = %@", data1);
        UIImage *image1 = [UIImage imageWithData:data1];
        NSLog(@"%@", image1);
        [cell.btn1 setImage:image1 forState:UIControlStateNormal];
        [cell.btn1 addTarget:self action:@selector(ClickPressEnter:) forControlEvents:UIControlEventTouchUpInside];
        
        NSString *str2 = _imageArray1[indexPath.row * 3 + 1];
        NSURL *url2 = [NSURL URLWithString:str2];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        UIImage *image2 = [UIImage imageWithData:data2];
        [cell.btn2 setImage:image2 forState:UIControlStateNormal];
        [cell.btn1 addTarget:self action:@selector(ClickPressEnter:) forControlEvents:UIControlEventTouchUpInside]; 
        
        NSString *str3 = _imageArray1[indexPath.row * 3 + 2];
        NSURL *url3 = [NSURL URLWithString:str3];
        NSData *data3 = [NSData dataWithContentsOfURL:url3];
        UIImage *image3 = [UIImage imageWithData:data3];
        [cell.btn3 setImage:image3 forState:UIControlStateNormal];

        
        cell.nameLabel1.text = self.titleArray1[indexPath.row * 3];
        cell.nameLabel2.text = self.titleArray1[indexPath.row * 3 + 1];
        cell.nameLabel3.text = self.titleArray1[indexPath.row * 3 + 2];
        cell.gradeLabel1.text = _gradeArray1[indexPath.row * 3];
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
        cell.gradeLabel2.text = _gradeArray1[indexPath.row * 3 + 1];
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
        cell.gradeLabel3.text = _gradeArray1[indexPath.row * 3 + 2];
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
        return cell;
    } else {
        DBMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell2" forIndexPath:indexPath];
        if ([self.titleArray2 count] == 0) {
            return cell;
        }
        cell.backgroundColor = [UIColor blackColor];
        NSString *str1 = _imageArray2[indexPath.row * 3];
        NSLog(@"%@", str1);
        NSURL *url1 = [NSURL URLWithString:str1];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        UIImage *image1 = [UIImage imageWithData:data1];
        [cell.btn1 setImage:image1 forState:UIControlStateNormal];
        
        NSString *str2 = _imageArray2[indexPath.row * 3 + 1];
        NSURL *url2 = [NSURL URLWithString:str2];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        UIImage *image2 = [UIImage imageWithData:data2];
        [cell.btn2 setImage:image2 forState:UIControlStateNormal];
        
        NSString *str3 = _imageArray2[indexPath.row * 3 + 2];
        NSURL *url3 = [NSURL URLWithString:str3];
        NSData *data3 = [NSData dataWithContentsOfURL:url3];
        UIImage *image3 = [UIImage imageWithData:data3];
        [cell.btn3 setImage:image3 forState:UIControlStateNormal];
        
        NSLog(@"%f", self.bookAndAudioView.scrollView.contentOffset.x);
        cell.nameLabel1.text = self.titleArray2[indexPath.row * 3];
        cell.nameLabel2.text = self.titleArray2[indexPath.row * 3 + 1];
        cell.nameLabel3.text = self.titleArray2[indexPath.row * 3 + 2];
        cell.gradeLabel1.text = _gradeArray2[indexPath.row * 3];
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
        cell.gradeLabel2.text = _gradeArray2[indexPath.row * 3 + 1];
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
        cell.gradeLabel3.text = _gradeArray2[indexPath.row * 3 + 2];
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
        return cell;
    }
//    cell.delegate = self;

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


- (void)ClickPressScroll:(UISegmentedControl *)segmentControl {
    if (segmentControl.selectedSegmentIndex == 0) {
        [_bookAndAudioView.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else {
        if ([_titleArray2 count] == 0) {
            [self postDataType:@"will"];
        }
        [_bookAndAudioView.scrollView setContentOffset:CGPointMake(_width, 0) animated:YES];
    }
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
