//
//  MIYUVoiceView.m
//  MIYU
//
//  Created by hanyutong on 2018/3/19.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVoiceView.h"

@interface MIYUVoiceView ()

@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
@property (weak, nonatomic) IBOutlet UIImageView *voiceline;
@property (nonatomic, assign) int i;
@property (nonatomic, strong) NSTimer * repeatTimer;




@end

@implementation MIYUVoiceView

 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  NSLog(@"began");
  self.i = 0;
  self.repeatTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(voicelineStartMove) userInfo:nil repeats:YES];

}

- (void)voicelineStartMove
{
  //获取一个随机整数范围在：[0,100)包括0，不包括100
//  int x = arc4random() % 3;
  self.i++;
  if (self.i == 3)
  {
    self.i = 0;
  }
  [UIView animateWithDuration:0.5 animations:^{
    NSString * voicelineIV = [NSString stringWithFormat:@"voiceline%d",self.i];
    self.voiceline.image = [UIImage imageNamed:voicelineIV];
  }];

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"move");
    [self.repeatTimer invalidate];
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"cancel");
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   NSLog(@"end");
   [self.repeatTimer invalidate];
}



// 无效释放
- (void)delloc
{
  [self.repeatTimer invalidate];
  self.repeatTimer = nil;
}

@end
