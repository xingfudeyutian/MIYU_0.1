//
//  MIYUTabBarController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUTabBarController.h"
#import "MIYUNavigationViewController.h"

#import "MIYUHomeViewController.h"
#import "MIYUSquareViewController.h"
#import "MIYUMessageViewController.h"
#import "MIYUMineViewController.h"

#import "MIYUBaseSquareCollectionController.h"

@interface MIYUTabBarController ()

@end

@implementation MIYUTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewControllers];
}
- (void)addChildViewControllers
{
    /** 首页 */
    MIYUHomeViewController *homeVC = [[MIYUHomeViewController alloc] init];
    [self setupOneChildViewController:homeVC Title:@"首页" normalImg:IMAGE_Original(@"Icons_Home5") selImg:IMAGE_Original(@"Icons_Home1")];

    /** 广场 */
    MIYUSquareViewController *squareVC = [[MIYUSquareViewController alloc] init];

//    MIYUBaseSquareCollectionController *squareVC = [[MIYUBaseSquareCollectionController alloc] init];


    [self setupOneChildViewController:squareVC Title:@"广场" normalImg:IMAGE_Original(@"Icons_Home2") selImg:IMAGE_Original(@"Icons_Home7")];



    /** 私信 */
    MIYUMessageViewController *messageVC = [[MIYUMessageViewController alloc] init];
    [self setupOneChildViewController:messageVC Title:@"私信" normalImg:IMAGE_Original(@"Icons_Home3") selImg:IMAGE_Original(@"Icons_Home4")];

    /** 我的 */
    MIYUMineViewController *mineVC = [[MIYUMineViewController alloc] init];
    [self setupOneChildViewController:mineVC Title:@"我的" normalImg:IMAGE_Original(@"Icons_Home") selImg:IMAGE_Original(@"Icons_Home6")];

    self.selectedIndex = 0;
}

/**
 *  添加一个子控制器
 *
 */
- (void)setupOneChildViewController:(UIViewController *)childVc Title:(NSString *)title normalImg:(UIImage *)normalImg selImg:(UIImage *)selImg
{
    MIYUNavigationViewController *nav = [[MIYUNavigationViewController alloc] initWithRootViewController:childVc];

    [self addChildViewController:nav];

    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : [UIFont systemFontOfSize:19.f],
                                     NSForegroundColorAttributeName : [UIColor blackColor]
                                     };
    [childVc.navigationController.navigationBar setTitleTextAttributes:textAttributes];

    [childVc.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : [UIColor blackColor]
                                                 } forState:UIControlStateSelected];
    childVc.title = title;
    childVc.tabBarItem.image = normalImg;
    childVc.tabBarItem.selectedImage = selImg;
    childVc.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
