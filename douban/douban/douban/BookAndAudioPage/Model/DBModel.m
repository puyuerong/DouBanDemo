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

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"listId":@"id"}];
}
@end
