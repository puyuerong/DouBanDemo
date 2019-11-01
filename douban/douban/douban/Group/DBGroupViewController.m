//
//  DBGroupViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/11.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBGroupViewController.h"

@interface DBGroupViewController ()

@end

@implementation DBGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 200, 275, 20)];
    [self.view addSubview:progressView];
    progressView.backgroundColor = [UIColor grayColor];
//    progressView.progressViewStyle = UIProgressViewStyleBar;
    progressView.progressViewStyle = UIProgressViewStyleDefault;
    progressView.progressTintColor = [UIColor orangeColor];
    progressView.progress = 0.8;
    [UIView animateWithDuration:5 animations:^{
        [progressView setProgress:0.8 animated:YES];
    } completion:^(BOOL finished){
        }];
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
