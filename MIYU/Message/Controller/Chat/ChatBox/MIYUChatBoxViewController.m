//
//  MIYUChatBoxViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/19.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUChatBoxViewController.h"

@interface MIYUChatBoxViewController ()

@property (nonatomic, assign) CGRect keyboardFrame;
@property (nonatomic, strong) MIYUChatBoxView *chatBoxView;
@property (nonatomic, strong) MIYUVoiceView   *chatBoxVoiceView;
@property (nonatomic, strong) MIYUFaceView    *chatBoxFaceView;
@property (nonatomic, strong) MIYUGiftView    *chatBoxGiftView;

@end

@implementation MIYUChatBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.chatBoxView];

  /**
   *  添加两个键盘回收通知
   */
  // 即将隐藏

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  // 键盘的Frame值即将发生变化的时候创建的额监听
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void) viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [self resignFirstResponder];
}


#pragma mark - Public Methods

- (BOOL)resignFirstResponder
{
  if(self.chatBoxView.status != TLChatBoxStatusNothing)
  {

    [self.chatBoxView resignFirstResponder];
    self.chatBoxView.status = TLChatBoxStatusNothing;
    if(self.changeChatBoxHeightBlock)
    {
      [UIView animateWithDuration:0.3 animations:^{

        self.changeChatBoxHeightBlock(self, self.chatBoxView.curHeight);

      } completion:^(BOOL finished) {
        [self.chatBoxFaceView removeFromSuperview];
        [self.chatBoxVoiceView removeFromSuperview];
        [self.chatBoxGiftView removeFromSuperview];
      }];
    }
  }
   return [super resignFirstResponder];
}



- (void) chatBox:(MIYUChatBoxView *)chatBox changeStatusForm:(MIYUChatBoxStatus)fromStatus to:(MIYUChatBoxStatus)toStatus
{
  if(toStatus == TLChatBoxStatusShowKeyboard)
  {
    // 显示键盘 删除VoiceView 和 FaceView和GiftView
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [self.chatBoxVoiceView removeFromSuperview];
      [self.chatBoxFaceView removeFromSuperview];
      [self.chatBoxGiftView removeFromSuperview];
    });
    return;
  }
  else if (toStatus == TLChatBoxStatusShowVoice)
  {
    /**
     *   变化到展示 表情View 的状态，这个过程中，根据 fromStatus 区分，要是是照片、视频和无状态改变过来的，则高度变化是一样的。 其他的高度就是另外一种，根据 fromStatus 来进行一个区分。
     */

    if (fromStatus == TLChatBoxStatusShowPhoto || fromStatus == TLChatBoxStatusShowVideo ||fromStatus == TLChatBoxStatusNothing)
    {
      self.chatBoxVoiceView.y = self.chatBoxView.curHeight ;

      [self.view addSubview:self.chatBoxVoiceView];
      [UIView animateWithDuration:0.3 animations:^{

        if (self.changeChatBoxHeightBlock)
        {
          self.changeChatBoxHeightBlock(self, self.chatBoxView.height + HEIGHT_CHATBOXVIEW);
        }
      }];
    }else
    {
      self.chatBoxVoiceView.y = self.chatBoxView.curHeight + HEIGHT_CHATBOXVIEW;
      [self.view addSubview:self.chatBoxVoiceView];
      [UIView animateWithDuration:0.3 animations:^{
        self.chatBoxVoiceView.y = self.chatBoxView.curHeight;
      } completion:^(BOOL finished) {
        [self.chatBoxFaceView removeFromSuperview];
        [self.chatBoxGiftView removeFromSuperview];
      }];
      // 整个界面高度变化
      if (fromStatus != TLChatBoxStatusShowFace || fromStatus != TLChatBoxStatusShowGift) {
        [UIView animateWithDuration:0.2 animations:^{
          if (self.changeChatBoxHeightBlock)
          {
            self.changeChatBoxHeightBlock(self, self.chatBoxView.curHeight + HEIGHT_CHATBOXVIEW);
          }
        }];
      }
    }


  }else if (toStatus == TLChatBoxStatusShowFace)
  {
    if (fromStatus == TLChatBoxStatusShowPhoto || fromStatus == TLChatBoxStatusShowVideo ||fromStatus == TLChatBoxStatusNothing)
    {
      self.chatBoxVoiceView.y = self.chatBoxView.curHeight ;

      [self.view addSubview:self.chatBoxFaceView];
      [UIView animateWithDuration:0.3 animations:^{

        if (self.changeChatBoxHeightBlock)
        {
          self.changeChatBoxHeightBlock(self, self.chatBoxView.height + HEIGHT_CHATBOXVIEW);
        }
      }];
    }else
    {
      self.chatBoxFaceView.y = self.chatBoxView.curHeight + HEIGHT_CHATBOXVIEW;
      [self.view addSubview:self.chatBoxFaceView];
      [UIView animateWithDuration:0.3 animations:^{
        self.chatBoxFaceView.y = self.chatBoxView.curHeight;
      } completion:^(BOOL finished) {
        [self.chatBoxVoiceView removeFromSuperview];
        [self.chatBoxGiftView removeFromSuperview];
      }];
      // 整个界面高度变化
      if (fromStatus != TLChatBoxStatusShowVoice || fromStatus != TLChatBoxStatusShowGift) {
        [UIView animateWithDuration:0.2 animations:^{
          if (self.changeChatBoxHeightBlock)
          {
            self.changeChatBoxHeightBlock(self, self.chatBoxView.curHeight + HEIGHT_CHATBOXVIEW);
          }
        }];
      }
    }
  }else if (toStatus == TLChatBoxStatusShowGift)
  {
    if (fromStatus == TLChatBoxStatusShowPhoto || fromStatus == TLChatBoxStatusShowVideo ||fromStatus == TLChatBoxStatusNothing)
    {
      self.chatBoxGiftView.y = self.chatBoxView.curHeight;

      [self.view addSubview:self.chatBoxGiftView];
      [UIView animateWithDuration:0.3 animations:^{

        if (self.changeChatBoxHeightBlock)
        {
          self.changeChatBoxHeightBlock(self, self.chatBoxView.height + HEIGHT_CHATBOXVIEW);
        }
      }];
    }else
    {
      self.chatBoxGiftView.y = self.chatBoxView.curHeight + HEIGHT_CHATBOXVIEW;
      [self.view addSubview:self.chatBoxGiftView];
      [UIView animateWithDuration:0.3 animations:^{
        self.chatBoxGiftView.y = self.chatBoxView.curHeight;
      } completion:^(BOOL finished) {
        [self.chatBoxVoiceView removeFromSuperview];
        [self.chatBoxFaceView removeFromSuperview];
      }];
      // 整个界面高度变化
      if (fromStatus != TLChatBoxStatusShowVoice || fromStatus != TLChatBoxStatusShowFace) {
        [UIView animateWithDuration:0.2 animations:^{
          if (self.changeChatBoxHeightBlock)
          {
            self.changeChatBoxHeightBlock(self, self.chatBoxView.curHeight + HEIGHT_CHATBOXVIEW);
          }
        }];
      }
    }
  }else
  {
        [self.chatBoxGiftView removeFromSuperview];
        [self.chatBoxVoiceView removeFromSuperview];
        [self.chatBoxFaceView removeFromSuperview];

        if (self.photoOrVideoShowBlock)
        {
          self.photoOrVideoShowBlock(toStatus);
        }
        [UIView animateWithDuration:0.3 animations:^{
          if (self.changeChatBoxHeightBlock)
          {
            self.changeChatBoxHeightBlock(self, self.chatBoxView.height );
          }
        }];
    }

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];

}

#pragma mark - Getter
- (MIYUChatBoxView *) chatBoxView
{

  if (_chatBoxView == nil) {
    _chatBoxView = [[MIYUChatBoxView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, HEIGHT_CHATBOXVIEW_TOOL)];
    @Weak(self)
    _chatBoxView.chatBoxChangeStatusBlock = ^(MIYUChatBoxView *chatBox, MIYUChatBoxStatus fromStatus, MIYUChatBoxStatus toStatus) {
      @Strong(self)
      [self chatBox:chatBox changeStatusForm:fromStatus to:toStatus];
    };

    _chatBoxView.sendMessageBlock = ^(MIYUChatBoxView *chatBox, NSString *textMessage) {
      @Strong(self)
      RCMessageModel *message = [[RCMessageModel alloc] init];
      if (self.sendMessageBlock)
      {
        self.sendMessageBlock(self, message);
      }

    };
    _chatBoxView.changeChatBoxViewHeightBlock = ^(MIYUChatBoxView *chatBox, CGFloat height) {
      @Strong(self)
      self.chatBoxFaceView.y = height;
      self.chatBoxVoiceView.y = height;
      self.chatBoxGiftView.y = height;

      if (self.changeChatBoxHeightBlock)
      {
        // 改变 控制器高度
        float h = (self.chatBoxView.status == TLChatBoxStatusShowFace ? HEIGHT_CHATBOXVIEW : self.keyboardFrame.size.height ) + height;
        self.changeChatBoxHeightBlock(self, h);
      }
    };
   }
  return _chatBoxView;
}
-(MIYUVoiceView *) chatBoxVoiceView
{
  if (_chatBoxVoiceView == nil) {
    _chatBoxVoiceView = [MIYUVoiceView viewFromXIB];
    _chatBoxVoiceView.frame = CGRectMake(0, HEIGHT_CHATBOXVIEW_TOOL, FUll_VIEW_WIDTH, HEIGHT_CHATBOXVIEW);

//    _chatBoxVoiceView = [[MIYUVoiceView alloc] initWithFrame:CGRectMake(0, HEIGHT_CHATBOXVIEW_TOOL, FUll_VIEW_WIDTH, HEIGHT_CHATBOXVIEW)];

  }
  return _chatBoxVoiceView;
}
-(MIYUGiftView *) chatBoxGiftView
{
  if (_chatBoxGiftView == nil) {
    _chatBoxGiftView = [[MIYUGiftView alloc] initWithFrame:CGRectMake(0, HEIGHT_CHATBOXVIEW_TOOL, FUll_VIEW_WIDTH, HEIGHT_CHATBOXVIEW)];
    _chatBoxGiftView.backgroundColor = [UIColor redColor];
  }
  return _chatBoxGiftView;
}

-(MIYUFaceView *) chatBoxFaceView
{
  if (_chatBoxFaceView == nil) {
    _chatBoxFaceView = [[MIYUFaceView alloc] initWithFrame:CGRectMake(0, HEIGHT_CHATBOXVIEW_TOOL, FUll_VIEW_WIDTH, HEIGHT_CHATBOXVIEW)];
    _chatBoxFaceView.backgroundColor = [UIColor yellowColor];
  }
  return _chatBoxFaceView;
}

#pragma mark - Private Methods

- (void)keyboardWillHide:(NSNotification *)notification{

  self.keyboardFrame = CGRectZero;
  if (_chatBoxView.status == TLChatBoxStatusShowFace || _chatBoxView.status == TLChatBoxStatusShowVoice|| _chatBoxView.status == TLChatBoxStatusShowGift) {
    return;
  }
  if(self.changeChatBoxHeightBlock)
  {
    self.changeChatBoxHeightBlock(self,self.chatBoxView.curHeight);
  }
}


/**
 *  点击了 textView 的时候，这个方法的调用是比  - (void) textViewDidBeginEditing:(UITextView *)textView 要早的。

 */
- (void)keyboardFrameWillChange:(NSNotification *)notification{

  self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  if(_chatBoxView.status == TLChatBoxStatusShowKeyboard &&self.keyboardFrame.size.height <=HEIGHT_CHATBOXVIEW){
    return;
  }else if((_chatBoxView.status == TLChatBoxStatusShowFace ||_chatBoxView.status == TLChatBoxStatusShowVoice)&& self.keyboardFrame.size.height<=HEIGHT_CHATBOXVIEW)
  {
    return;
  }

  if(self.changeChatBoxHeightBlock)
  {
    self.changeChatBoxHeightBlock(self, self.keyboardFrame.size.height + self.chatBoxView.curHeight);
  }

}


- (void)dealloc{

  /**
   *  移除键盘通知
   */
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}



 

@end
