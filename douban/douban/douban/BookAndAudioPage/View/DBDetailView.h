//
//  DBDetailView.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/18.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBDetailView : UIView
@property UIScrollView *scrollView;
@property UIImageView *moviewImageView;
@property UILabel *nameLabel;
@property UILabel *yearLabel;
@property UILabel *detailLabel;
@property UIButton *wantButton;
@property UIButton *hadButton;
@property UIImageView *assessImageView;
@property UILabel *titleLabel;
@property UILabel *gradeLabel;
@property UILabel *numberLabel;
@property NSString *name;
@property NSString *year;
@property NSString *describe;
@property UIProgressView *progressView1;
@property UIProgressView *progressView2;
@property UIProgressView *progressView3;
@property UIProgressView *progressView4;
@property UIProgressView *progressView5;
@property UILabel *introduceLabel;
@end

NS_ASSUME_NONNULL_END
