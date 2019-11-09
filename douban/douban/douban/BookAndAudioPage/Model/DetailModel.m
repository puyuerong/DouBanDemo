//
//  DetailModel.m
//  douban
//
//  Created by 蒲悦蓉 on 2019/11/9.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "DetailModel.h"

@implementation StarRatingModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation RateModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation StarDetailModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"list1":@"1", @"list2":@"2", @"list3":@"3", @"list4":@"4", @"list5":@"5"}];
}
@end

@implementation AuthorModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation CommentModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end

@implementation DetailModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
@end
