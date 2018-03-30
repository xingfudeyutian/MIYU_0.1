//
//  MIYUTInfoCell.m
//  MIYU
//
//  Created by hanyutong on 2018/1/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUTInfoCell.h"
@interface MIYUTInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *item;
@property (weak, nonatomic) IBOutlet UILabel *info;

@end

@implementation MIYUTInfoCell


-(void)setModel:(id)model
{
    self.item.text = model[@"item"];
    self.info.text = model[@"info"];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
