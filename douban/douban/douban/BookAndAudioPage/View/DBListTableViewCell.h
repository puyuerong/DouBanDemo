//
//  DBListTableViewCell.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/18.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBListTableViewCell : UITableViewCell
@property UIImageView *movieImageView;
@property UILabel *nameLabel;
@property UILabel *gradeLabel;
@property UILabel *detailLabel;
@property UIButton *buyButton;
@property UILabel *numberLabel;
@property UIImageView *starImageView;

@end

NS_ASSUME_NONNULL_END
