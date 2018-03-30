//
//  MIYURecommendViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYURecommendViewController.h"
#import "MIYURecommendViewController+UI.h"


@interface MIYURecommendViewController ()


@end

@implementation MIYURecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];



}
-(void)reusableViewAction:(NSInteger)tag
{
#warning ?????导航失效！！！

    MIYUBaseSquareCollectionController * vc = [[MIYUBaseSquareCollectionController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.cellType = MIYUCELLTYPE_RECTAGLE;
    [self.superViewController.navigationController pushViewController:vc animated:YES];

//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
//
//    [self presentViewController:nav animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
