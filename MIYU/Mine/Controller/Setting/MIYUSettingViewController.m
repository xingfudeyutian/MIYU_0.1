//
//  MIYUSettingViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/30.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUSettingViewController.h"
#import "MIYUAccountSettingViewController.h"
#import "MIYUVideoSettingViewController.h"
#import "MIYUPrivacySettingViewController.h"
#import "MIYUConnectUsViewController.h"
 


@interface MIYUSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray * items;

@end

@implementation MIYUSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.items[section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  return section?200:CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
  UIView * view = [UIView new];
  UIButton * logout = [[UIButton alloc] initWithFrame:CGRectMake(30, 150, FUll_VIEW_WIDTH-60, 50)];
  logout.layer.cornerRadius = 25.0;
  logout.backgroundColor = COLOR_YELLOW;
  logout.titleLabel.text = @"退出登录";
  [logout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [logout setTitle:@"退出登录" forState:UIControlStateNormal];
  logout.titleLabel.font = [UIFont systemFontOfSize:16];
  [view addSubview:logout];
  return section?view:nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if(!cell)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
  }
  cell.textLabel.text = self.items[indexPath.section][indexPath.row];
  cell.textLabel.font = [UIFont systemFontOfSize:13];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

  MIYUBaseViewController * vc;
  if (indexPath.section)
  {
    if(indexPath.row)
    {
      //给我评价
    }
    else
    {
      //联系我们
      vc = [MIYUConnectUsViewController new];
    }
  }
  else
  {
    if (indexPath.row == 0)
    {
      //账号设置
      vc = [MIYUAccountSettingViewController new];

    }
    else if (indexPath.row == 1)
    {
      //视频设置
      vc = [MIYUVideoSettingViewController new];
    }
    else
    {
      //隐私和通知
      vc = [MIYUPrivacySettingViewController new];
    }
  }
  vc.title = self.items[indexPath.section][indexPath.row];
  [self.navigationController pushViewController:vc animated:YES];

}

-(NSArray *)items
{
  if (_items == nil)
  {
      _items = @[
                @[ @"账号设置",
                 @"视频设置",
                 @"隐私和通知",],
                @[@"联系我们",
                  @"给我评价"]
                ];
  }
  return _items;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
