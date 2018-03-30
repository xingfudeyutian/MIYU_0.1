//
//  MIYUBarrageViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/27.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBarrageViewController.h"

@interface MIYUBarrageViewController ()

@property (nonatomic, strong) OCBarrageManager *barrageManager;

@end

@implementation MIYUBarrageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barrageManager = [[OCBarrageManager alloc] init];
    self.barrageManager.renderView.frame = self.view.frame;
    self.barrageManager.renderView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.barrageManager.renderView];

    self.view.backgroundColor = [UIColor clearColor];

    [self.barrageManager start];
    [self startBarrage];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];

  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(addNormalBarrage) object:nil];

}

- (void)addBarrage {
  [self performSelector:@selector(addNormalBarrage) withObject:nil afterDelay:0.5];

}

- (void)addNormalBarrage {

  OCBarrageTextDescriptor *textDescriptor = [[OCBarrageTextDescriptor alloc] init];
  textDescriptor.text = [NSString stringWithFormat:@"这是一条弹幕...."];
  textDescriptor.textColor = [UIColor whiteColor];
  textDescriptor.positionPriority = OCBarragePositionLow;
  textDescriptor.textFont = [UIFont systemFontOfSize:14.0];
  textDescriptor.strokeColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
  textDescriptor.strokeWidth = -1;
  textDescriptor.animationDuration = arc4random()%5 + 5;
  textDescriptor.barrageCellClass = [OCBarrageTextCell class];

  [self.barrageManager renderBarrageDescriptor:textDescriptor];

  [self performSelector:@selector(addNormalBarrage) withObject:nil afterDelay:1];
}


- (void)startBarrage {
  [self.barrageManager start];
  [self addBarrage];
}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}





@end
