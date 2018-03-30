//
//  MIYUNormalReusableView.m
//  MIYU
//
//  Created by hanyutong on 2018/1/26.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUNormalReusableView.h"


@implementation MIYUNormalReusableView

- (IBAction)selectAction:(id)sender {
    if (self.reusableViewSelectBlock)
    {
        self.reusableViewSelectBlock(nil);
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
