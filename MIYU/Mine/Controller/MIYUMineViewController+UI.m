//
//  MIYUMineViewController+UI.m
//  MIYU
//
//  Created by hanyutong on 2018/1/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMineViewController+UI.h"
#import "MIYUNormalCell.h"
#import "MIYUMineInfoCell.h"




@implementation MIYUMineViewController (UI)

- (void)setupSubViews
{

}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section?55:UITableViewAutomaticDimension;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    BaseTableViewCell * cell;
    if (indexPath.section == 0)
    {
        cell = [MIYUMineInfoCell xibCellWithTableView:tableView];

    }
    else
    {
        cell = [MIYUNormalCell xibCellWithTableView:tableView];
        cell.textLabel.text = self.items[indexPath.section][indexPath.row][@"title"];
        cell.imageView.image = IMAGE(self.items[indexPath.section][indexPath.row][@"image"]);
        cell.detailTextLabel.text = self.items[indexPath.section][indexPath.row][@"detail"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self cellSelectedWithIndexPath:indexPath];
}


@end
