//
//  MIYUPrivacySettingViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/30.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUPrivacySettingViewController.h"

@interface MIYUPrivacySettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray * items;
@end

@implementation MIYUPrivacySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return self.items.count;
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
  return section? CGFLOAT_MIN: 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
  UIView * view = [UIView new];
  view.backgroundColor = [UIColor clearColor];
  UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, FUll_VIEW_WIDTH-40, 50)];
  label.numberOfLines = 0;
  label.backgroundColor = [UIColor clearColor];
  label.text = section?nil:@"请在iPhone的“设置”-“通用”功能中，找到应用程序“同伴”中更改";
  label.textColor = [UIColor lightGrayColor];
  label.font = [UIFont systemFontOfSize:10];
  [view addSubview:label];
  return section?nil:view;
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



  UISwitch * switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
  switchBtn.onTintColor = COLOR_YELLOW;
  cell.accessoryView = indexPath.section==1?switchBtn:nil;

  cell.detailTextLabel.font = [UIFont systemFontOfSize:13];


  if (indexPath.section != 1 )
  {
    if ((indexPath.section ==4) && (indexPath.row == 1)) {
      cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
  }

  NSString * detail;
  if (indexPath.section == 0)
  {
    detail = @"已开启";
  }
  else if (indexPath.section == 2)
  {
    detail = @"全部";
  }else if(indexPath.section == 4&&indexPath.row == 1)
  {
    detail = @"0KB";
  }
  cell.detailTextLabel.text = detail;

  return cell;
}

-(NSArray *)items
{
  if (_items == nil)
  {
    _items = @[
               @[@"接受消息通知"],
               @[@"来电提醒",
                 @"鱼塘直播提醒",
                 @"允许别人保存我发的照片"],
               @[@"谁可以给我发消息"],
               @[@"黑名单"],
               @[@"清空聊天记录",@"清空图片视频缓存"],
               ];
  }
  return _items;
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
