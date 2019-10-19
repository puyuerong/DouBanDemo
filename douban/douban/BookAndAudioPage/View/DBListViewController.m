//
//  DBListViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/17.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBListViewController.h"
#import "DBListView.h"
#import "DBNothingViewController.h"
#import "Masonry.h"
#import "DBDetailViewController.h"
@interface DBListViewController ()
@property DBListView *listView;
@end
/* 导航栏下划线去除*/
/*获取导航栏和状态栏高度*/
@implementation DBListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
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

    int width = [UIScreen mainScreen].bounds.size.width;
    int hight = [UIScreen mainScreen].bounds.size.height;
    int nHight = self.navigationController.navigationBar.frame.size.height;
    int statusHight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    _listView = [[DBListView alloc] init];
    [self.view addSubview:_listView];
    [_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(self.view).offset(hight - nHight - statusHight);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(nHight + statusHight);
    }];
    _listView.delegate = self;
    
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
