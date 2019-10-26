//
//  DBMainTableViewCell.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/13.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MainTableViewCellDelegate <NSObject>

- (void)ClickPressEnterDetail:(UIButton*)btn;

@end


@interface DBMainTableViewCell : UITableViewCell
@property UIButton *btn1;
@property UIButton *btn2;
@property UIButton *btn3;
@property UILabel *nameLabel1;
@property UILabel *nameLabel2;
@property UILabel *nameLabel3;
@property UILabel *gradeLabel1;
@property UILabel *gradeLabel2;
@property UILabel *gradeLabel3;
@property UIImageView *starImageView1;
@property UIImageView *starImageView2;
@property UIImageView *starImageView3;
@property id<MainTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
