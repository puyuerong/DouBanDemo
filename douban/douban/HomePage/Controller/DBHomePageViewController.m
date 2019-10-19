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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 275, 50)];
    [self.view addSubview:imageView];
    int grade;
    grade = 10;
    for (int i = 0; i <= 4; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 60, 0, 50, 50)];
        [imageView addSubview:starImageView];
        if (grade - 2 < 0) {
            if (grade - 2 == -2) {
                starImageView.image = [UIImage imageNamed:@"emptyStar"];
            } else {
                starImageView.image = [UIImage imageNamed:@"halfStar"];
                grade = 0;
            }
        } else {
            starImageView.image = [UIImage imageNamed:@"allStar"];
            grade = grade - 2;
        }
    }
        
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
