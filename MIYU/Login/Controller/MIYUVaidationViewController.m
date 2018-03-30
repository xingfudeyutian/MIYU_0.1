//
//  MIYUVaidationViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVaidationViewController.h"
#import "MIYUBasicInfoViewController.h"


@interface MIYUVaidationViewController ()

@end

@implementation MIYUVaidationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToLastVC:)];

}
- (IBAction)backToLastVC:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)goToNextVC:(id)sender {
    MIYUBasicInfoViewController * basicVC = [[MIYUBasicInfoViewController alloc] init];
    [self.navigationController pushViewController:basicVC animated:YES];
//    [self presentViewController:basicVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
