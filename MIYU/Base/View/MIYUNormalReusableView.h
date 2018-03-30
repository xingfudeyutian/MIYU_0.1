//
//  MIYUNormalReusableView.h
//  MIYU
//
//  Created by hanyutong on 2018/1/26.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReusableViewSelectBlock)(id);

@interface MIYUNormalReusableView : UICollectionReusableView

@property (nonatomic, copy) ReusableViewSelectBlock reusableViewSelectBlock;

@end
