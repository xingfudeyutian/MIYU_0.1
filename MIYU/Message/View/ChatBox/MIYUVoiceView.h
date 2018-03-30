//
//  MIYUVoiceView.h
//  MIYU
//
//  Created by hanyutong on 2018/3/19.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,MIRecordStatus){
  MI_RECORD_STATUS_BEAGIN = 0, //开始
  MI_RECORD_STATUS_END,//结束
  MIYUCELLTYPE_CANCEL,//取消
};

typedef void(^VoiceRecordBlock) (MIRecordStatus status);

@interface MIYUVoiceView : UIView

@property (nonatomic, copy) VoiceRecordBlock voiceRecordBlock;


@end
