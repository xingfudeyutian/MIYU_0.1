//
//  MIYUDefineHeader.h
//  MIYU
//
//  Created by hanyutong on 2018/1/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#ifndef MIYUDefineHeader_h
#define MIYUDefineHeader_h


#define RONGCLOULDIM_KEY @"lmxuhwagxl20d"


#define IMAGE(x)  [UIImage imageNamed:x]
#define IMAGE_Original(x)  [[UIImage imageNamed:x] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
#define COLOR_YELLOW     [UIColor colorWithHexString:@"FFDD00"]
//全屏宽和高大小(Full screen width and height)
#define FUll_VIEW_WIDTH     ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT    ([[UIScreen mainScreen] bounds].size.height)
#define FUll_CONTENT_HEIGHT     FUll_VIEW_HEIGHT - NavigationBarHeight
#define TabbarHeight    49
#define NavigationBarHeight 64
#define HEIGHT_CHATBOXVIEW 200
#define HEIGHT_CHATBOXVIEW_TOOL 103
#define     CHATBOX_BUTTON_WIDTH        37
#define     HEIGHT_TEXTVIEW             40
#define     MAX_TEXTVIEW_HEIGHT         60
//weak
#define Weak(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define Strong(o) autoreleasepool{} __strong typeof(o) o = o##Weak;


typedef NS_ENUM(NSInteger,MIYUCellType){
  MIYUCELLTYPE_SQUARE = 0, //方型
  MIYUCELLTYPE_RECTAGLE,//长条形
  MIYUCELLTYPE_VIDEO,//视频框
};





#endif /* MIYUDefineHeader_h */
