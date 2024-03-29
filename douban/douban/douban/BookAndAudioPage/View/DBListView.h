//
//  DBListView.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/17.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DBListViewDelegate <NSObject>

- (void)ClickPressCell;

@end
@interface DBListView : UIView
@property UISegmentedControl *segmentControl;
@property UITableView *listTableView;
//@property UITableView *listTableView2;
@property id<DBListViewDelegate>delegate;
@property UIScrollView *scrollView;
@end

NS_ASSUME_NONNULL_END
