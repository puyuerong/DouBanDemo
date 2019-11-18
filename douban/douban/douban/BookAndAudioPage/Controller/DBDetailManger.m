//
//  DBDetailManger.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/11/2.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//
/*https://douban-api.uieee.com
 https://douban.uieee.com （支持 HTTP / HTTPS，已备案）
 https://douban-api.uieee.com （已备案）
 https://douban-api.now.sh
 https://douban-api.zce.now.sh
 https://douban-api-git-master.zce.now.sh*/


#import "DBDetailManger.h"

#define FrontApi "https://douban-api.uieee.com"
static DBDetailManger *manger;
@implementation DBDetailManger

+ (instancetype)sharedMange {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manger == nil) {
            manger = [[DBDetailManger alloc] init];
        }
    });
    return manger;
}

- (void)postData:(detailSuccessful)result id:(NSString *)idStr {
    NSString *str = [NSString stringWithFormat:@"%s/v2/movie/subject/%@", FrontApi, idStr];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *detailDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            DetailModel *detailModel = [[DetailModel alloc] initWithDictionary:detailDictionary error:nil];
            result(detailModel);
        } else {
            NSLog(@"%@", error);
        }
    }];
    [dataTask resume];
}

@end
