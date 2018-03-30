//
//  MIYUChatBoxView.m
//  MIYU
//
//  Created by hanyutong on 2018/3/19.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUChatBoxView.h"

#define margin 10.0f


@interface MIYUChatBoxView ()<YYTextViewDelegate>

@property (nonatomic, strong) YYTextView *textView;  // 输入框
@property (nonatomic, strong) UIButton *voiceButton; // 声音按钮
@property (nonatomic, strong) UIButton *photoButton; // 图片按钮
@property (nonatomic, strong) UIButton *videoButton; // 视频按钮
@property (nonatomic, strong) UIButton *faceButton;  // 表情按钮
@property (nonatomic, strong) UIButton *giftButton;  // 礼物按钮

@end


@implementation MIYUChatBoxView

-(id)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    _curHeight = frame.size.height;// 当前高度初始化为 103
    [self addSubview:self.textView];
    [self addSubview:self.voiceButton];
    [self addSubview:self.photoButton];
    [self addSubview:self.videoButton];
    [self addSubview:self.faceButton];
    [self addSubview:self.giftButton];
     self.status = TLChatBoxStatusNothing;//初始化状态是空
  }

  return self;

}
- (BOOL) resignFirstResponder
{

  [self.textView resignFirstResponder];
  return [super resignFirstResponder];

}

//-(void)setFrame:(CGRect)frame
//{
//  // 6 的初始化 0.0.375.49
//  [super setFrame:frame];
//#warning 待调试
//  //  y=  49 -  ( CHATBOX_BUTTON_WIDTH )  37 - (View 的H - Button的H )/2
//  //  Voice 的高度和宽度初始化的时候都是 37
//  float y = self.height - self.voiceButton.height - (HEIGHT_CHATBOXVIEW_MIN - CHATBOX_BUTTON_WIDTH) / 2;
//  if (self.voiceButton.y != y) {
//    [UIView animateWithDuration:0.1 animations:^{
//
//      // 根据 Voice 的 Y 改变 faceButton  moreButton de Y
//      self.voiceButton.y = y;
//      self.photoButton.y = self.voiceButton.y;
//      self.videoButton.y = self.voiceButton.y;
//      self.giftButton.y = self.voiceButton.y;
//      self.faceButton.y = self.voiceButton.y;
//    }];
//  }
//}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(YYTextView *)textView
{
    MIYUChatBoxStatus lastStatus = self.status;
    self.status = TLChatBoxStatusShowKeyboard;

    if(self.chatBoxChangeStatusBlock)
    {
      self.chatBoxChangeStatusBlock(self, lastStatus, self.status);
    }

}
-(void)textViewDidChange:(YYTextView *)textView
{
  CGFloat height = [textView sizeThatFits:CGSizeMake(self.textView.width, MAXFLOAT)].height;
  height = height > HEIGHT_TEXTVIEW ? height:HEIGHT_TEXTVIEW;
  height = height < MAX_TEXTVIEW_HEIGHT ? height : textView.height;
  _curHeight = height + HEIGHT_CHATBOXVIEW_TOOL - HEIGHT_TEXTVIEW;
  if(_curHeight != self.height){
    [UIView animateWithDuration:0.05 animations:^{
      self.height = _curHeight;
      if (self.changeChatBoxViewHeightBlock) {
        self.changeChatBoxViewHeightBlock(self, _curHeight);
      }
    }];
  }

  if (height != textView.height) {
    [UIView animateWithDuration:0.05 animations:^{
      textView.height = height;
    }];
  }
}
/**
 *  发送当前消息
 */

- (void) sendCurrentMessage
{
  if (self.textView.text.length > 0) {     // send Text
    if (self.sendMessageBlock) {
      self.sendMessageBlock(self, self.textView.text);
    }
  }
  [self.textView setText:@""];
  [self textViewDidChange:self.textView];
}


- (void) deleteButtonDown
{
  [self textView:self.textView shouldChangeTextInRange:NSMakeRange(self.textView.text.length - 1, 1) replacementText:@""];
  [self textViewDidChange:self.textView];
}

////内容将要发生改变编辑
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{

  if ([text isEqualToString:@"\n"]){
    [self sendCurrentMessage];
    return NO;
  }
  /**
   *
   */
  else if (textView.text.length > 0 && [text isEqualToString:@""]) {       // delete

    if ([textView.text characterAtIndex:range.location] == ']') {

      NSUInteger location = range.location;
      NSUInteger length = range.length;
      while (location != 0) {
        location --;
        length ++ ;
        char c = [textView.text characterAtIndex:location];
        if (c == '[') {

          textView.text = [textView.text stringByReplacingCharactersInRange:NSMakeRange(location, length) withString:@""];
          return NO;

        }
        else if (c == ']') {

          return YES;
        }
      }
    }
  }

  return YES;
}
#pragma mark - Event Response
/**
 *  声音按钮点击
 *
 */
- (void) voiceButtonDown:(UIButton *)sender
{
  MIYUChatBoxStatus lastStatus = self.status;
  if (lastStatus != TLChatBoxStatusShowVoice) {
    self.status = TLChatBoxStatusShowVoice;
    [self.textView resignFirstResponder];
    if (lastStatus == TLChatBoxStatusShowPhoto || lastStatus == TLChatBoxStatusShowVideo) {
      [self textViewDidChange:self.textView];
    }

    if (self.chatBoxChangeStatusBlock)
    {
      self.chatBoxChangeStatusBlock(self, lastStatus, self.status);
    }
  }
}
- (void) faceButtonDown:(UIButton *)sender
{
  MIYUChatBoxStatus lastStatus = self.status;// 记录下上次的状态
  if (lastStatus != TLChatBoxStatusShowFace) {
    self.status = TLChatBoxStatusShowFace;

     if (lastStatus == TLChatBoxStatusShowPhoto || lastStatus == TLChatBoxStatusShowVideo) {

      [self textViewDidChange:self.textView];
    }
    else if (lastStatus == TLChatBoxStatusShowKeyboard) {

      [self.textView resignFirstResponder];
    }
    if (self.chatBoxChangeStatusBlock)
    {
      self.chatBoxChangeStatusBlock(self, lastStatus, self.status);
    }
  }

}
- (void) giftButtonDown:(UIButton *)sender
{
  MIYUChatBoxStatus lastStatus = self.status;// 记录下上次的状态
  if (lastStatus != TLChatBoxStatusShowGift) {
    self.status = TLChatBoxStatusShowGift;

    if (lastStatus == TLChatBoxStatusShowPhoto || lastStatus == TLChatBoxStatusShowVideo) {
      [self textViewDidChange:self.textView];
    }
    else if (lastStatus == TLChatBoxStatusShowKeyboard) {
      [self.textView resignFirstResponder];
    }
    if (self.chatBoxChangeStatusBlock)
    {
      self.chatBoxChangeStatusBlock(self, lastStatus, self.status);
    }
  }
}
- (void) photoButtonDown:(UIButton *)sender
{
  MIYUChatBoxStatus lastStatus = self.status;// 记录下上次的状态
  if (lastStatus != TLChatBoxStatusShowPhoto) {
    self.status = TLChatBoxStatusShowPhoto;

//    if (lastStatus == TLChatBoxStatusShowVoice || lastStatus == TLChatBoxStatusShowFace || lastStatus == TLChatBoxStatusShowGift) {
//      [self textViewDidChange:self.textView];
//    }
//    else
      if (lastStatus == TLChatBoxStatusShowKeyboard) {
      [self.textView resignFirstResponder];
    }
    if (self.chatBoxChangeStatusBlock)
    {
      self.chatBoxChangeStatusBlock(self, lastStatus, self.status);
    }
  }
}
- (void) videoButtonDown:(UIButton *)sender
{
  MIYUChatBoxStatus lastStatus = self.status;// 记录下上次的状态
  if (lastStatus != TLChatBoxStatusShowVideo) {
    self.status = TLChatBoxStatusShowVideo;

//    if (lastStatus == TLChatBoxStatusShowVoice || lastStatus == TLChatBoxStatusShowFace || lastStatus == TLChatBoxStatusShowGift) {
//      [self textViewDidChange:self.textView];
//    }
//    else
      if (lastStatus == TLChatBoxStatusShowKeyboard) {
      [self.textView resignFirstResponder];
    }
    if (self.chatBoxChangeStatusBlock)
    {
      self.chatBoxChangeStatusBlock(self, lastStatus, self.status);
    }
  }
}
#pragma mark - Getter

- (YYTextView *) textView
{
  if (_textView == nil) {
    CGRect frame = CGRectMake(margin, margin, self.width-2*margin, 4*margin);
    _textView = [[YYTextView alloc] initWithFrame:frame];
    _textView.placeholderText = @"点击输入信息";
    _textView.backgroundColor = [UIColor colorWithHexString:@"#F5F7F9"];
    [_textView setFont:[UIFont systemFontOfSize:13.0f]];
    [_textView.layer setMasksToBounds:YES];
    [_textView.layer setCornerRadius:4.0f];
    [_textView setScrollsToTop:NO];
    [_textView setReturnKeyType:UIReturnKeySend];// 返回按钮更改为发送
    [_textView setDelegate:self];
  }
  return _textView;
}
-(UIButton *)voiceButton
{
  if (_voiceButton == nil){

    CGRect frame = CGRectMake(margin, _textView.bottom+margin, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH);
    _voiceButton = [[UIButton alloc] initWithFrame:frame];
    [_voiceButton setImage:[UIImage imageNamed:@"microphone"] forState:UIControlStateNormal];
    [_voiceButton addTarget:self action:@selector(voiceButtonDown:) forControlEvents:UIControlEventTouchUpInside];

  }
  return _voiceButton;
}
-(UIButton *)photoButton
{
  if(_photoButton == nil){
    CGFloat buttonMargin =  (self.width - 2*margin - 5*CHATBOX_BUTTON_WIDTH)/4;
    CGRect frame = CGRectMake(_voiceButton.right + buttonMargin, _voiceButton.y, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH);
    _photoButton = [[UIButton alloc] initWithFrame:frame];
    [_photoButton setImage:[UIImage imageNamed:@"photo"] forState:UIControlStateNormal];
    [_photoButton addTarget:self action:@selector(photoButtonDown:) forControlEvents:UIControlEventTouchUpInside];
  }
  return _photoButton;
}
-(UIButton *)videoButton
{
  if(_videoButton == nil){
    CGFloat buttonMargin =  (self.width - 2*margin - 5*CHATBOX_BUTTON_WIDTH)/4;
    CGRect frame = CGRectMake(_photoButton.right + buttonMargin, _voiceButton.y, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH);
    _videoButton = [[UIButton alloc] initWithFrame:frame];
    [_videoButton setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [_videoButton addTarget:self action:@selector(videoButtonDown:) forControlEvents:UIControlEventTouchUpInside];
  }
  return _videoButton;
}
-(UIButton *)giftButton
{
  if(_giftButton == nil){
    CGFloat buttonMargin =  (self.width - 2*margin - 5*CHATBOX_BUTTON_WIDTH)/4;
    CGRect frame = CGRectMake(_videoButton.right + buttonMargin, _voiceButton.y, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH);
    _giftButton = [[UIButton alloc] initWithFrame:frame];
    [_giftButton setImage:[UIImage imageNamed:@"gift"] forState:UIControlStateNormal];
    [_giftButton addTarget:self action:@selector(giftButtonDown:) forControlEvents:UIControlEventTouchUpInside];
  }
  return _giftButton;
}
-(UIButton *)faceButton
{
  if(_faceButton == nil){
//    CGFloat buttonMargin =  (self.width - 2*margin - 5*CHATBOX_BUTTON_WIDTH)/4;
    CGRect frame = CGRectMake(self.width-margin-CHATBOX_BUTTON_WIDTH, _voiceButton.y, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH);
    _faceButton = [[UIButton alloc] initWithFrame:frame];
    [_faceButton setImage:[UIImage imageNamed:@"emoj"] forState:UIControlStateNormal];
    [_faceButton addTarget:self action:@selector(faceButtonDown:) forControlEvents:UIControlEventTouchUpInside];
  }
  return _faceButton;
}
@end
