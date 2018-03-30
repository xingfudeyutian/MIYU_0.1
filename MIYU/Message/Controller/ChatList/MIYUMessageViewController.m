//
//  MIYUMessageViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMessageViewController.h"
#import "MIYUChatListHeader.h"
#import "MIYUConversationViewController.h"

@interface MIYUMessageViewController ()

@end

@implementation MIYUMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //设置需要显示哪些类型的会话
  [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                      @(ConversationType_DISCUSSION),
                                      @(ConversationType_CHATROOM),
                                      @(ConversationType_GROUP),
                                      @(ConversationType_APPSERVICE),
                                      @(ConversationType_SYSTEM)]];
  //设置需要将哪些类型的会话在会话列表中聚合显示
  [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                        @(ConversationType_GROUP)]];




  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:IMAGE_Original(@"microphone") style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction)];

  UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, 200)];
  view.backgroundColor = [UIColor redColor];
  MIYUChatListHeader * tableViewHeader = [MIYUChatListHeader viewFromXIB];// [[MIYUChatListHeader alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, 200)];
  self.conversationListTableView.tableHeaderView = tableViewHeader;
  self.conversationListTableView.sectionHeaderHeight = 200;


  self.conversationListTableView.tableFooterView = [UIView new];

}

- (void)rightBarButtonAction
{

}
//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {

  MIYUConversationViewController *conversationVC = [[MIYUConversationViewController alloc]init];

//  RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
  conversationVC.conversationType = model.conversationType;
  conversationVC.targetId = model.targetId;
  conversationVC.title = @"想显示的会话标题";
  conversationVC.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:conversationVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
