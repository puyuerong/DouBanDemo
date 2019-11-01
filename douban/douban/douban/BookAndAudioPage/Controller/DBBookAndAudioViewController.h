//
//  DBBookAndAudioViewController.h
//  douban
//
//  Created by 蒲悦蓉 on 2019/10/11.
//  Copyright © 2019 蒲悦蓉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBBookAndAudioView.h"
#import "DBMainTableViewCell.h"
#import "DBMainTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBBookAndAudioViewController : UIViewController
<DBBookAndAudioDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, MainTableViewCellDelegate>
@property NSMutableArray *titleArray1;
@property NSMutableArray *gradeArray1;
@property NSMutableArray *imageArray1;
@property NSMutableArray *titleArray2;
@property NSMutableArray *gradeArray2;
@property NSMutableArray *imageArray2;
@end

NS_ASSUME_NONNULL_END
