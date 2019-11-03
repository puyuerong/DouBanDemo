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

@end

@implementation DBDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       //设置返回按钮只保留箭头
    DBDetailView *detailView = [[DBDetailView alloc] init];
    int hight = [UIScreen mainScreen].bounds.size.height;
    int statusHight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    int h = self.navigationController.navigationBar.frame.size.height;
    int width = [UIScreen mainScreen].bounds.size.width;
    [self.view addSubview:detailView];
    [detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(@(hight - statusHight - h));
    }];
    
    
    // Do any additional setup after loading the view.
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





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
