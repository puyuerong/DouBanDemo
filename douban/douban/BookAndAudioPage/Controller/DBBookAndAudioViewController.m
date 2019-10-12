//
//  DBBookAndAudioViewController.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/11.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBBookAndAudioViewController.h"
#import "DBBookAndAudioView.h"
@interface DBBookAndAudioViewController ()

@end

@implementation DBBookAndAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    DBBookAndAudioView *bookAndAudioView = [[DBBookAndAudioView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:bookAndAudioView];

}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:nil];
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
