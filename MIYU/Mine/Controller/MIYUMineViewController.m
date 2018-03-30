//
//  MIYUMineViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMineViewController.h"
#import "MIYUMineViewController+UI.h"

#import "MIYUMineInfoViewController.h"

#import "MIYUIncomeViewController.h"
#import "MIYUVirtualmoneyViewController.h"
#import "MIYUVipViewController.h"

#import "MIYUFeedbackViewController.h"
#import "MIYUSettingViewController.h"


#import "MIYUAppDelegate.h"

@interface MIYUMineViewController ()

@end

@implementation MIYUMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];



}

- (void)cellSelectedWithIndexPath:(NSIndexPath *)indexPath
{

    MIYUBaseViewController * vc;
    switch (indexPath.section) {
        case 0:
        {
            //个人资料
            vc = [MIYUMineInfoViewController new];
        }
            break;
        case 1:
        {
            if(indexPath.row == 0)
            {
                //我的收益
                vc = [MIYUIncomeViewController new];

            }else if (indexPath.row == 1)
            {
                //我的鱼饵
                vc = [MIYUVirtualmoneyViewController new];

            }else if (indexPath.row == 2)
            {
                //我的等级
                vc = [MIYUVipViewController new];
            }else if (indexPath.row == 3)
            {
                //VIP服务
                vc = [MIYUVipViewController new];
            }
        }
            break;
        case 2:
        {
            //分享赚钻石
        }
            break;
        case 3:
        {
            if (indexPath.row == 0)
            {
                //意见反馈
                vc = [MIYUFeedbackViewController new];
            }else
            {
                //设置
                vc = [MIYUSettingViewController new];
            }
        }
            break;
        default:
            break;
    }
    vc.title = self.items[indexPath.section][indexPath.row][@"title"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableArray *)items
{
    if (!_items)
    {
       NSArray * item = @[
                    @[@{@"image":@"Group 17",
                        @"title":@"我的资料",
                        @"detail":@"鱼饵：xxx"}],
                   @[@{@"image":@"Group 17",
                       @"title":@"我的收益",
                       @"detail":@"鱼饵：xxx"},
                      @{@"image":@"Group 19",
                        @"title":@"我的鱼饵",
                        @"detail":@"鱼饵：xxx"},
                     @{@"image":@"Group 21",
                       @"title":@"我的等级",
                       @"detail":@"等级：Lv2"},
                     @{@"image":@"Group 23",
                       @"title":@"VIP服务",
                       @"detail":@"VIP服务最少3天"},
                     ],
                   @[@{@"image":@"Group 25",
                       @"title":@"分享赚钻石",
                       @"detail":@""},],
                   @[@{@"image":@"Rectangle 7",
                       @"title":@"意见反馈",
                       @"detail":@""},
                     @{@"image":@"Group 29",
                       @"title":@"设置",
                       @"detail":@""},]
                   ];
        _items = [NSMutableArray arrayWithArray:item];
    }
    return _items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
