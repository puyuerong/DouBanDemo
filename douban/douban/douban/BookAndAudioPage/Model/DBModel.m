//
//  DBModel.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/24.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DBModel.h"

@implementation DBModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation ImageModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation RatingModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation CastsModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation DirectorsModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end


@implementation DBNowModel

//- (instancetype)initWithJson:(NSDictionary *)json {
//    self = [DBNowModel new];
//    if (self) {
//        self.title = json[@"title"];
////        self.average = json[@"average"];
////        self.year = json[@"year"];
////        self.pubdates = json[@"pubdates"];
////        self.genres = json[@"genres"];
////        self.casts = json[@"casts"];
////        self.directors = json[@"directors"];
////        self.collect_count = json[@"collect_count"];
//    }
//    return self;
//}
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
