//
//  DBHomePageViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/11.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBHomePageViewController.h"

@interface DBHomePageViewController ()

@end

@implementation DBHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str1 = @"1998-";
    NSString *str = @"11-15";
    NSLog(@"%ld, %ld", [str1 length], [str length]);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 275, 50)];
    [self.view addSubview:imageView];
    NSString *grade0 = @"8.5";
    
        
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
