//
//  MIYUBaseSquareCollectionController.h
//  MIYU
//
//  Created by hanyutong on 2018/1/26.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"

@interface MIYUBaseSquareCollectionController : MIYUBaseViewController
@property (nonatomic, strong) UIViewController * parentVC;
@property (nonatomic, assign) MIYUCellType  cellType;

@end
