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
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"电影";
    self.navigationController.navigationBar.topItem.title = @"";         //设置返回按钮只保留箭头
    DBDetailView *detailView = [[DBDetailView alloc] init];
    int hight = [UIScreen mainScreen].bounds.size.height;
    int statusHight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    int h = self.navigationController.navigationBar.frame.size.height;
    [detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(@(hight - statusHight - h));
    }];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor]; //设置颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
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
