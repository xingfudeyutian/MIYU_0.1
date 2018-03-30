//
//  MIYUVideoToolView.m
//  MIYU
//
//  Created by hanyutong on 2018/3/26.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoToolView.h"
@interface MIYUVideoToolView ()
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation MIYUVideoToolView

-(BOOL)resignFirstResponder
{
  [super resignFirstResponder];
  [self.textView resignFirstResponder];
  return YES;
}

@end
