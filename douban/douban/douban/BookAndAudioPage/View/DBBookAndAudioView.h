//
//  DBBookAndAudioView.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/12.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBMainTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@protocol DBBookAndAudioDelegate <NSObject>

- (void)ClickButton:(UIButton*)btn;
- (void)ClickTableViewButton:(UIButton*)btn;
- (void)ClickPressScroll:(UISegmentedControl*)segmentControl;

@end

@interface DBBookAndAudioView : UIView
<MainTableViewCellDelegate>
@property UIScrollView *scrollView;
@property UITextField *searchTextField;
@property UIImageView *codeImaegView;
@property UIImageView *mailImageView;
@property UISegmentedControl *segmentController;
@property UIImageView *searchImageView;
@property NSMutableArray *btnArray;
@property UIButton *allButton;
@property UITableView *movieTableView;
@property id<DBBookAndAudioDelegate>delegate;
@property UITableView *movieTableView2;
@end

NS_ASSUME_NONNULL_END
