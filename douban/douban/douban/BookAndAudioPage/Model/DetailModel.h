//
//  DetailModel.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/11/9.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CommentModel
@end
@protocol AuthorModel
@end
@protocol RateModel
@end
@protocol StarRatingModel
@end
@protocol StarDetailModel
@end

@interface RateModel : JSONModel
@property NSInteger value;
@end

@interface StarDetailModel : JSONModel
@property NSString *list1;
@property NSString *list2;
@property NSString *list3;
@property NSString *list4;
@property NSString *list5;
@end

@interface StarRatingModel : JSONModel
@property StarDetailModel *details;
@end

@interface AuthorModel : JSONModel
@property NSString *avatar;
@property NSString *name;
@end

@interface CommentModel : JSONModel
@property NSString *content;
@property NSString *created_at;
@property AuthorModel *author;
@property RateModel *rating;
@end

@interface DetailModel : JSONModel
@property NSString *summary;
@property NSMutableArray<CommentModel>*popular_comments;
@property StarRatingModel *rating;
@property NSArray *countries;
@end



NS_ASSUME_NONNULL_END
