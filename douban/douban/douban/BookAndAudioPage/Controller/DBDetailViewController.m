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

@interface DBDetailViewController ()
@property UILabel *nameLabel;
@property NSInteger width;
@property DBDetailView *detailView;
@property NSInteger hight;
@end

@implementation DBDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       //设置返回按钮只保留箭头
    _width = [UIScreen mainScreen].bounds.size.width;
    _hight = [UIScreen mainScreen].bounds.size.height;
    [self postDetail:_nowModel.listId];
//    _nameLabel = [[UILabel alloc] init];
//    _nameLabel.font = [UIFont systemFontOfSize:30];
//    _nameLabel.numberOfLines = 0;
//    _nameLabel.text = @"dahf食噶结果客服你发打开了罚款的";
//    CGSize size = [_nameLabel.text boundingRectWithSize:CGSizeMake(230, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_nameLabel.font} context:nil].size;
//    NSLog(@"width = %f, hight = %f", size.width, size.height);
//    _nameLabel.frame = CGRectMake(140, 50, size.width, size.height);
//
//    UILabel *yearLabel = [[UILabel alloc] init];
//    [self.view addSubview:yearLabel];
//    yearLabel.font = [UIFont systemFontOfSize:30];
//    yearLabel.numberOfLines = 0;
//    yearLabel.text = _nowModel.year;
//    CGSize size1 = [yearLabel.text boundingRectWithSize:CGSizeMake(230, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:yearLabel.font} context:nil].size;
//    yearLabel.frame = CGRectMake(, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
//    [yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(100));
//        make.height.equalTo(@(100));
//        make.left.equalTo(self.view).offset(50);
//        make.top.equalTo(self.view).offset(200);
//    }];
    
    _detailView = [[DBDetailView alloc] init];
    _detailView.name = _nowModel.title;
    _detailView.year = _nowModel.year;
//    _detailView.describe = _detailModel.countries[0];
    _detailView.describe = @"";
    _detailView.describe = [_detailView.describe stringByAppendingString:@"/"];
    for (int i = 0; i < [_nowModel.countries count]; i++) {
        _detailView.describe = [_detailView.describe stringByAppendingString:_nowModel.countries[i]];
        _detailView.describe = [_detailView.describe stringByAppendingString:@" "];
    }
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
    [_detailView layoutSubviews];
    int hight = [UIScreen mainScreen].bounds.size.height;
    int statusHight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    int h = self.navigationController.navigationBar.frame.size.height;
    int width = [UIScreen mainScreen].bounds.size.width;
    [self.view addSubview:_detailView];
    [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(@(hight - statusHight - h));
    }];
    
    UIImage *image1 = [[UIImage imageNamed:@"want.PNG"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_detailView.wantButton setImage:image1 forState:UIControlStateNormal];
    [_detailView.wantButton setTitle:@"想看" forState:UIControlStateNormal];
    _detailView.wantButton.backgroundColor = [UIColor whiteColor];
    _detailView.wantButton.tintColor = [UIColor blackColor];
    
    [_detailView.hadButton setImage:image1 forState:UIControlStateNormal];
    [_detailView.hadButton setTitle:@"看过" forState:UIControlStateNormal];
    _detailView.hadButton.backgroundColor = [UIColor whiteColor];
    _detailView.hadButton.tintColor = [UIColor blackColor];
    
    NSString *str = _nowModel.images.medium;
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    _detailView.moviewImageView.image = image;
   
    _detailView.gradeLabel.text = _nowModel.rating.average;
    NSLog(@"gagerfsafre");

    
    
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
    
    
    
    float sum = [self Transform:self.detailModel.rating.details.list1] + [self Transform:self.detailModel.rating.details.list2] +[self Transform:self.detailModel.rating.details.list3] + [self Transform:self.detailModel.rating.details.list4] + [self Transform:self.detailModel.rating.details.list5];
    _detailView.progressView1.progress = [self Transform:self.detailModel.rating.details.list5] / sum * 100;
    NSLog(@"%f", _detailView.progressView1.progress);
    _detailView.progressView2.progress = [self Transform:self.detailModel.rating.details.list4] / sum * 100;
    _detailView.progressView3.progress = [self Transform:self.detailModel.rating.details.list3] / sum * 100;
    _detailView.progressView4.progress = [self Transform:self.detailModel.rating.details.list2] / sum * 100;
    _detailView.progressView5.progress = [self Transform:self.detailModel.rating.details.list1] / sum * 100;

    _detailView.introduceLabel.text = [NSString stringWithFormat:@"剧情简介\n\n%@", _detailModel.summary];
    _detailView.introduceLabel.numberOfLines = 0;
    
}
- (void)viewDidAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.13f green:0.36f blue:0.49f alpha:1.00f];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.topItem.title = @"";

    self.title = @"电影";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor]; //设置颜色
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
