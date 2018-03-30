//
//  MIYUConversationViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/15.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUConversationViewController.h"
#import "MIYUChatBoxViewController.h"

@interface MIYUConversationViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)MIYUChatBoxViewController * chatBoxVC;

@end

@implementation MIYUConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.chatSessionInputBarControl setHidden:YES];
    [self.view  addSubview:self.chatBoxVC.view];
    [self addChildViewController:self.chatBoxVC];
    [self.conversationMessageCollectionView scrollToBottomAnimated:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:IMAGE_Original(@"friendship") style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction)];
}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  CGRect frame =  self.conversationMessageCollectionView.frame;
  self.conversationMessageCollectionView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, self.conversationMessageCollectionView.height-(HEIGHT_CHATBOXVIEW_TOOL-TabbarHeight));


}
-(void)rightBarButtonAction
{

}

- (void)tap4ResetDefaultBottomBarStatus:(UIGestureRecognizer *)gestureRecognizer
{

  [self.chatBoxVC resignFirstResponder];

}


-(MIYUChatBoxViewController *) chatBoxVC
{
  if (_chatBoxVC == nil) {
    _chatBoxVC = [[MIYUChatBoxViewController alloc] init];
    [_chatBoxVC.view setFrame:CGRectMake(0, FUll_VIEW_HEIGHT - HEIGHT_CHATBOXVIEW_TOOL, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT)];
    @Weak(self)
    _chatBoxVC.sendMessageBlock = ^(MIYUChatBoxViewController *chatBoxViewController, RCMessageModel *messageModel) {
        @Strong(self)
    };
    _chatBoxVC.photoOrVideoShowBlock = ^(MIYUChatBoxStatus status) {
        @Strong(self)

    };
    
    _chatBoxVC.changeChatBoxHeightBlock = ^(MIYUChatBoxViewController *chatBoxViewController, CGFloat height) {
        @Strong(self)
      /**
       *   改变BoxController .view 的高度 ，这采取的是重新设置 Frame 值！！
       */
      [UIView animateWithDuration:0.3 animations:^{
        self.conversationMessageCollectionView.height = FUll_VIEW_HEIGHT - height - NavigationBarHeight;
        self.chatBoxVC.view.y = self.conversationMessageCollectionView.y + self.conversationMessageCollectionView.height;
        if (self.conversationMessageCollectionView.contentSize.height > self.conversationMessageCollectionView.height)
        {
          [self.conversationMessageCollectionView scrollToBottomAnimated:YES];
        }
      }];
    };
  }
  return _chatBoxVC;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
