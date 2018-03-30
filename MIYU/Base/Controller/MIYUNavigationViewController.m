//
//  MIYUNavigationViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUNavigationViewController.h"

@interface MIYUNavigationViewController ()
@property(nonatomic,weak) UIViewController* currentShowVC;
@end

@implementation MIYUNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationBar.translucent = NO;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];

    if (viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count > 1)
    {
        [self creatBackButtonWithVC:viewController];
        self.currentShowVC = viewController;
    }

}



- (void)creatBackButtonWithVC:(UIViewController *)VC
{
    self.interactivePopGestureRecognizer.enabled = YES;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"back_dark"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    VC.navigationItem.leftBarButtonItem = backItem;
VC.navigationController.interactivePopGestureRecognizer.delegate = (id)VC;
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
