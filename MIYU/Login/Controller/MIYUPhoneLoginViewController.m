//
//  MIYUPhoneLoginViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUPhoneLoginViewController.h"

#import "MIYUVaidationViewController.h"




@interface MIYUPhoneLoginViewController ()

@end

@implementation MIYUPhoneLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getAgreement:(id)sender {


}
- (IBAction)getVerificationCode:(id)sender {

    MIYUVaidationViewController * vaidationVC = [[MIYUVaidationViewController alloc] init];
    [self.navigationController pushViewController:vaidationVC animated:YES];
//    [self presentViewController:nav animated:YES completion:nil];
//    [self.navigationController pushViewController:vaidationVC animated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
