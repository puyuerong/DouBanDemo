//
//  DBManger.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/24.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^successful)(DBModel *resuleModel, NSInteger i);

@interface DBManger : NSObject
+ (instancetype)sharedManger;
- (void)postNowData:(successful)result type: (NSString*)type;
@end

NS_ASSUME_NONNULL_END
