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
@protocol Directors1Model
@end
@protocol Avatars1Model
@end
@protocol Casts1Model
@end



@interface Avatars1Model : JSONModel
@property NSString *medium;
@end

@interface Directors1Model : JSONModel
@property NSString *name;
@property Avatars1Model *avatars;
@end

@interface Casts1Model : JSONModel
@property Avatars1Model *avatars;
@property NSString *name;
@end


@interface RateModel : JSONModel
@property NSString *value;
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
@property NSString *useful_count;
@end

@interface DetailModel : JSONModel
@property NSString *summary;
@property NSMutableArray<CommentModel>*popular_comments;
@property StarRatingModel *rating;
@property NSArray *countries;
@property NSString *wish_count;
@property NSMutableArray *tags;
@property NSMutableArray<Directors1Model> *directors;
@property NSMutableArray<Casts1Model> *casts;
@end



NS_ASSUME_NONNULL_END
