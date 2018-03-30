//
//  MIYUBasicInfoViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBasicInfoViewController.h"

@interface MIYUBasicInfoViewController ()

@end

@implementation MIYUBasicInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToLastVC:)];
    self.title = @"基础信息";
}
- (IBAction)backToLastVC:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
