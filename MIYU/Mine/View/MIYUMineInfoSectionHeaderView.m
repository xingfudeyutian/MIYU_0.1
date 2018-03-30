//
//  MIYUMineInfoSectionHeaderView.m
//  MIYU
//
//  Created by hanyutong on 2018/1/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMineInfoSectionHeaderView.h"
#import "MIYUMineInfoView.h"

@interface MIYUMineInfoSectionHeaderView ()

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) MIYUMineInfoView * infoView;

@end


@implementation MIYUMineInfoSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{

    self.contentView.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, 240)];
    self.imageView.backgroundColor = [UIColor orangeColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.image = [UIImage imageNamed:@"info"];
    self.imageView.clipsToBounds = YES;
    [self addSubview:self.imageView];

    self.infoView = [MIYUMineInfoView viewFromXIB];
    self.infoView.frame = CGRectMake(10, 250, FUll_VIEW_WIDTH-20, 204);
    [self addSubview:self.infoView];




}
@end
