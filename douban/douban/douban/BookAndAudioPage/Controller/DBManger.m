//
//  DBManger.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/24.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//
/*https://douban-api.uieee.com
 https://douban.uieee.com （支持 HTTP / HTTPS，已备案）
 https://douban-api.uieee.com （已备案）
 https://douban-api.now.sh
 https://douban-api.zce.now.sh
 https://douban-api-git-master.zce.now.sh*/
#import "DBManger.h"
#import "DBModel.h"
static DBManger *manger;

#define nowHttp "https://douban-api.uieee.com"
@implementation DBManger


+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manger == nil) {
            manger = [[DBManger alloc] init];
        }
    });
    return manger;
}


- (void)postNowData:(successful)result type: (NSString*)type {
    NSString *str;
    if ([type isEqualToString:@"now"]) {
        str = [NSString stringWithFormat:@"%s/v2/movie/in_theaters", nowHttp];
    } else {
        str = [NSString stringWithFormat:@"%s/v2/movie/coming_soon", nowHttp];
    }
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *nowDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            DBModel *allData = [[DBModel alloc] initWithDictionary:nowDictionary error:nil];
//            DBNowModel *nowData = [[DBNowModel alloc] init];
//            nowData = allData.subjects[0];
            NSInteger i = [allData.subjects count];
            result(allData, i);
        } else {
            NSLog(@"FALSE");
        }
    }];
    [dataTask resume];
        
}
@end
/*
BFSubjectsModel *subjectModelone = [[BFSubjectsModel alloc] init];
subjectModelone = _myModel.subjects[0];

BFSubjectsModel *subjectModeltwo = [[BFSubjectsModel alloc] init];
subjectModeltwo = _myModel.subjects[1];

BFSubjectsModel *subjectModelthree = [[BFSubjectsModel alloc] init];
subjectModelthree = _myModel.subjects[2];

BFSubjectsModel *subjectModelfour = [[BFSubjectsModel alloc] init];
subjectModelfour = _myModel.subjects[3];

BFSubjectsModel *subjectModelfive = [[BFSubjectsModel alloc] init];
subjectModelfive = _myModel.subjects[4];

BFSubjectsModel *subjectModelsix = [[BFSubjectsModel alloc] init];
subjectModelsix = _myModel.subjects[5];
*/
