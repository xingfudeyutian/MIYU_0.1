//
//  MIYUMineViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"

@interface MIYUMineViewController : MIYUBaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * items;


- (void)cellSelectedWithIndexPath:(NSIndexPath *)indexPath;


@end
