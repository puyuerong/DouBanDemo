//
//  DBDetailViewController.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/18.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBModel.h"
#import "DetailModel.h"
#import "DBDetailManger.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDetailViewController : UIViewController
<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property DBNowModel *nowModel;
@property DetailModel *detailModel;
@end

NS_ASSUME_NONNULL_END
