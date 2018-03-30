//
//  MIYUChatBoxViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/3/19.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"
#import "MIYUChatBoxView.h"
#import "MIYUVoiceView.h"
#import "MIYUFaceView.h"
#import "MIYUGiftView.h"

@class MIYUChatBoxViewController;
@class RCMessageModel;

typedef void(^ChangeChatBoxHeightBlock) (MIYUChatBoxViewController *chatBoxViewController,CGFloat height);
typedef void(^SendMessageBlock) (MIYUChatBoxViewController *chatBoxViewController,RCMessageModel * messageModel);
typedef void(^PhotoORVideoShowBlock) (MIYUChatBoxStatus status);

@interface MIYUChatBoxViewController : MIYUBaseViewController

@property (nonatomic, copy) ChangeChatBoxHeightBlock changeChatBoxHeightBlock;
@property (nonatomic, copy) SendMessageBlock sendMessageBlock;
@property (nonatomic, copy) PhotoORVideoShowBlock photoOrVideoShowBlock;
@end

