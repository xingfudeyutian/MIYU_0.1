//
//  MIYUConnectUsViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/30.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUConnectUsViewController.h"

@interface MIYUConnectUsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray * items;
@end

@implementation MIYUConnectUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
  return section?50:10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView * view = [UIView new];
  view.backgroundColor = [UIColor clearColor];
  UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, FUll_VIEW_WIDTH-40, 50)];
  label.numberOfLines = 0;
  label.backgroundColor = [UIColor clearColor];
  label.text = @"常见问题";
  label.textColor = [UIColor lightGrayColor];
  label.font = [UIFont systemFontOfSize:10];
  [view addSubview:label];
  return section?view:nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
  return nil;
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

-(NSArray *)items
{
  if (_items == nil)
  {
    _items = @[
               @[@"我要反馈"],
               @[@"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 @"现金提取问题...",
                 ],
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
