//
//  WillTableViewCell.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/11/2.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WillTableViewCellDelegate <NSObject>

- (void)ClickPressEnterDetail:(UIButton*)btn;

@end


@interface WillTableViewCell : UITableViewCell
@property UIButton *btn1;
@property UIButton *btn2;
@property UIButton *btn3;
@property UILabel *nameLabel1;
@property UILabel *nameLabel2;
@property UILabel *nameLabel3;
@property UIButton *dataButton1;
@property UIButton *dataButton2;
@property UIButton *dataButton3;
@property UILabel *wantLabel1;
@property UILabel *wantLabel2;
@property UILabel *wantLabel3;
@property id<WillTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
