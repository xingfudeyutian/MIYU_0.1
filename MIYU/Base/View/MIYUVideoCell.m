//
//  MIYUVideoCell.m
//  MIYU
//
//  Created by hanyutong on 2018/3/14.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoCell.h"

@interface MIYUVideoCell ()

@property (weak, nonatomic) IBOutlet UILabel *MVPLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation MIYUVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(id)model
{

}

@end
