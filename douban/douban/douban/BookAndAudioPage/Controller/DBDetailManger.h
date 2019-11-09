//
//  DBDetailManger.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/11/2.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^detailSuccessful)(DetailModel *returnModel);

@interface DBDetailManger : NSObject
+ (instancetype)sharedMange;
- (void)postData:(detailSuccessful)result id:(NSString*)idStr;
@end

NS_ASSUME_NONNULL_END
