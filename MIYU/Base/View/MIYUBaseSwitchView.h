//
//  MIYUBaseSwitchView.h
//  MIYU
//
//  Created by hanyutong on 2018/1/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIYUBaseSwitchView : UIView

@property (nonatomic, copy) void(^switchBlock)(NSInteger tag);

@property (nonatomic,strong) NSArray * titles;

@property (nonatomic,assign)NSInteger currentPage;

@end
