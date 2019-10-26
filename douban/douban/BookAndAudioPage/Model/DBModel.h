//
//  DBModel.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/24.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN


//
//
@protocol DBNowModel
@end
@protocol DBSubjectModel
@end
//@protocol DBWillModel
//@end
//@protocol DBTotalModel
//@end
//
//
//

@interface DBSubjectModel: JSONModel
@property NSArray *subjects;
@end

@interface DBNowModel : JSONModel
@property NSString* title;
//@property NSString* average;
//@property NSString* year;
//@property NSArray* pubdates;
//@property NSArray* genres;
//@property NSArray* casts;
//@property NSArray* directors;
//@property NSString* collect_count;
//- (instancetype)initWithJson:(NSDictionary*)json;
@end
//
@interface DBModel : JSONModel
@property NSArray<DBNowModel>* subjects;
@end

//@protocol ProductModel
//@end

//@interface imageModel: JSONModel
//@property (nonatomic) NSString * medium;
//@end
//
//@interface RatingModel: JSONModel
//@property (nonatomic) NSInteger average;
//@end
//
//@interface ProductModel : JSONModel
//
//@property (nonatomic, copy) NSString * title;
//@property (nonatomic, copy) RatingModel * rating;
//@property (nonatomic, copy) imageModel * images ;
//
//@end
//
//@interface  DBBookPageModel: JSONModel
//@property (nonatomic) NSInteger total;
//@property (nonatomic, copy) NSArray <ProductModel> *subjects;
//
//@end
NS_ASSUME_NONNULL_END
