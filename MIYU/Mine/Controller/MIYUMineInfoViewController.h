//
//  MIYUMineInfoViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/1/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"
#import "MIYUBaseSwitchView.h"

@interface MIYUMineInfoViewController : MIYUBaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MIYUBaseSwitchView * switchView;

@property (nonatomic, strong) UIView * currentView;

@property (nonatomic, strong) UIScrollView * scrollTabView;
@property (nonatomic, strong) UIPageControl * pageControl;

@end
