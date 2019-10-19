//
//  ViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/11.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "ViewController.h"
#import "DBHomePageViewController.h"
#import "DBBookAndAudioViewController.h"
#import "DBGroupViewController.h"
#import "DBMarketViewController.h"
#import "DBMainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    
    UIImage *image = [UIImage imageNamed:@"roy3.JPG"];
    imageView.image = image;
    [self.view addSubview:imageView];
    [self performSelector:@selector(Enter) withObject:self afterDelay:1];
}
- (void)Enter {
    DBHomePageViewController *homePageVC = [[DBHomePageViewController alloc] init];
    DBBookAndAudioViewController *bookAndAudioVC = [[DBBookAndAudioViewController alloc] init];
    DBGroupViewController *groupVC = [[DBGroupViewController alloc]init];
    DBMarketViewController *marketVC = [[DBMarketViewController alloc] init];
    DBMainViewController *mainVC = [[DBMainViewController alloc] init];
    homePageVC.tabBarItem.title = @"首页";
    bookAndAudioVC.tabBarItem.title = @"书影音";
    groupVC.tabBarItem.title = @"小组";
    marketVC.tabBarItem.title = @"市集";
    mainVC.tabBarItem.title = @"我的";
    homePageVC.tabBarItem.image = [UIImage imageNamed:@"home"];
    bookAndAudioVC.tabBarItem.image = [UIImage imageNamed:@"shu"];
    groupVC.tabBarItem.image = [UIImage imageNamed:@"group"];
    marketVC.tabBarItem.image = [UIImage imageNamed:@"market"];
    mainVC.tabBarItem.image = [UIImage imageNamed:@"main"];
    UINavigationController *homePageNav = [[UINavigationController alloc] initWithRootViewController:homePageVC];
    UINavigationController *bookAndAudioNav = [[UINavigationController alloc] initWithRootViewController:bookAndAudioVC];
    UINavigationController *groupNav = [[UINavigationController alloc] initWithRootViewController:groupVC];
    UINavigationController *marketNav = [[UINavigationController alloc] initWithRootViewController:marketVC];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:homePageNav, bookAndAudioNav, groupNav, marketNav, mainNav, nil];
    tabBarController.viewControllers = array;
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    tabBarController.tabBar.tintColor = [UIColor greenColor];
    self.view.window.rootViewController = tabBarController;
}

@end
