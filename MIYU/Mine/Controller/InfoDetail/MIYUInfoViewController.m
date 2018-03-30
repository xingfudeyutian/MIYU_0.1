//
//  MIYUInfoViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUInfoViewController.h"
#import "MIYUDynamicCell.h"
#import "MIYUTInfoCell.h"

@interface MIYUInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * items;
@property (nonatomic, strong) NSMutableArray * infos;


@end

@implementation MIYUInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;

}
#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section?8:1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, FUll_VIEW_WIDTH, 40)];
    label.text = @"个人资料";
    label.font = [UIFont systemFontOfSize:14];
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    if (section == 1) {
        [view addSubview:label];
    }
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section?40:CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell * cell;
    if (indexPath.section == 0)
    {
        cell = [MIYUDynamicCell xibCellWithTableView:tableView];
    }
    else
    {
        cell = [MIYUTInfoCell xibCellWithTableView:tableView];
        cell.model = @{@"item":self.items[indexPath.row],@"info":self.infos[indexPath.row]};
    }
    return cell;
}





#pragma mark - LazyLoad

-(NSMutableArray *)items
{
    if (!_items)
    {
        NSArray * item = @[@"视频鱼饵",
                           @"个性签名",
                           @"性取向",
                           @"城市",
                           @"喜欢",
                           @"职业",
                           @"标签",
                           @"技能"
                           ];
        _items = [NSMutableArray arrayWithArray:item];
    }
    return _items;
}

-(NSMutableArray *)infos
{
    if (!_infos)
    {
        NSArray * info = @[@"免费",
                           @"天地玄黄，宇宙洪荒。日月盈仄，辰宿列张。寒来暑往，秋收冬藏。润馀成岁，律吕调阳。云腾致雨，露结为霜。",
                           @"男",
                           @"保密",
                           @"狗",
                           @"设计师",
                           @"标签",
                           @"技能"
                           ];
        _infos = [NSMutableArray arrayWithArray:info];
    }
    return _infos;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
