//
//  MIYUBaseViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/3.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"

@interface MIYUBaseViewController ()



@end

@implementation MIYUBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    // Do any additional setup after loading the view from its nib.
}
-(void)setupSubViews
{
    self.view.backgroundColor = [UIColor whiteColor];
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
