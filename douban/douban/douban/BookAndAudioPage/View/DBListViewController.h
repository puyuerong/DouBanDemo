//
//  DBListViewController.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/17.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBListView.h"
#import "DBManger.h"
#import "DBModel.h"
#import "DBListTableViewCell.h"
#import "DBNothingViewController.h"
#import "Masonry.h"
#import "DBDetailViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBListViewController : UIViewController
<DBListViewDelegate, DBListViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property DBModel *dataModel;
@property NSInteger num;
- (void)postData;
@end

NS_ASSUME_NONNULL_END
