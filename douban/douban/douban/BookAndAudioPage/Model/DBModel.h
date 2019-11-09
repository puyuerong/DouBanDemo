//
//  DBModel.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/24.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN


@protocol DBNowModel
@end
@protocol RatingModel
@end
@protocol ImageModel
@end
@protocol CastsModel
@end
@protocol DirectorsModel
@end

@interface DirectorsModel : JSONModel
@property NSString *name;
@end

@interface CastsModel : JSONModel
@property NSString *name;
@end

@interface ImageModel : JSONModel
@property NSString* medium;
@end

@interface RatingModel : JSONModel
@property NSString* average;
@end

@interface DBNowModel : JSONModel
@property NSString* title;
@property RatingModel* rating;
@property ImageModel* images;
@property NSMutableArray *pubdates;
@property NSString *year;
@property NSMutableArray *countries;
@property NSMutableArray *genres;
@property NSMutableArray <DirectorsModel>*directors;
@property NSMutableArray <CastsModel> *casts;
@property NSString *original_title;
@property NSString *collect_count;
@property NSMutableArray *durations;
@property NSString *listId;
@end

@interface DBModel : JSONModel
@property NSArray<DBNowModel>* subjects;
@end


//@protocol DBWillModel
//@end
//@protocol DBTotalModel
//@end
//
//
//

//@property NSString* average;
//@property NSString* year;
//@property NSArray* pubdates;
//@property NSArray* genres;
//@property NSArray* casts;
//@property NSArray* directors;
//@property NSString* collect_count;
//- (instancetype)initWithJson:(NSDictionary*)json;

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
