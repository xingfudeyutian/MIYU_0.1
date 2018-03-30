//
//  MIYURecommendViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/1/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"
#import "MIYUBaseSquareCollectionController.h"

@interface MIYURecommendViewController : MIYUBaseViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@property (nonatomic, strong) UIViewController * superViewController;

-(void)reusableViewAction:(NSInteger)tag;


@end
