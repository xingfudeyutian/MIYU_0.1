//
//  MIYUChatBoxView.h
//  MIYU
//
//  Created by hanyutong on 2018/3/19.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  枚举的一种定义形式,和基本的枚举定义类型一样，只是结构更加清晰点；
 */
typedef NS_ENUM(NSInteger, MIYUChatBoxStatus) {
  /**
   *  无状态
   */
  TLChatBoxStatusNothing,
  /**
   *  声音
   */
  TLChatBoxStatusShowVoice,
  /**
   *  照片
   */
  TLChatBoxStatusShowPhoto,
  /**
   *  视频
   */
  TLChatBoxStatusShowVideo,
  /**
   *  表情
   */
  TLChatBoxStatusShowFace,
  /**
   *  礼物
   */
  TLChatBoxStatusShowGift,
  /**
   *  键盘
   */
  TLChatBoxStatusShowKeyboard,

};

@class MIYUChatBoxView;

typedef void(^ChatBoxChangeStatusBlock) (MIYUChatBoxView * chatBox,MIYUChatBoxStatus fromStatus,MIYUChatBoxStatus toStatus);

typedef void (^SendTextMessageBlock)(MIYUChatBoxView * chatBox,NSString * textMessage);
typedef void (^ChangeChatBoxViewHeightBlock)(MIYUChatBoxView * chatBox,CGFloat height);



@interface MIYUChatBoxView : UIView

@property (nonatomic, copy  )ChatBoxChangeStatusBlock chatBoxChangeStatusBlock;
@property (nonatomic, copy  )SendTextMessageBlock sendMessageBlock;
@property (nonatomic, copy  )ChangeChatBoxViewHeightBlock changeChatBoxViewHeightBlock;

@property (nonatomic, assign) CGFloat curHeight;
@property (nonatomic, assign) MIYUChatBoxStatus status;

@end
