//
//  MIYUContentViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/14.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentViewController.h"
#import "MIYUContentDetailViewController.h"
#import "MIYUContentCell.h"


@interface MIYUContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MIYUContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MIYUContentCell * cell = [MIYUContentCell xibCellWithTableView:tableView];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUContentDetailViewController * contentDetail = [[MIYUContentDetailViewController alloc] init];
  contentDetail.hidesBottomBarWhenPushed = YES;
  [self.parentVC.navigationController pushViewController:contentDetail animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
