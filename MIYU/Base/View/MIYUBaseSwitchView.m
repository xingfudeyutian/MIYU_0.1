//
//  MIYUBaseSwitchView.m
//  MIYU
//
//  Created by hanyutong on 2018/1/5.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseSwitchView.h"

#define lineHeight 4
#define selectedFont [UIFont fontWithName:@"Helvetica-Bold" size:15]
#define unSelectedFont [UIFont systemFontOfSize:14]


@interface MIYUBaseSwitchView ()

@property (nonatomic, strong) UIView * underLineView;
@property (nonatomic, assign) NSInteger itemWidth;
@property (nonatomic, strong) UIButton * currentBtn;

@property (nonatomic, strong) NSMutableArray * items;

@end

@implementation MIYUBaseSwitchView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        [self setupSubviews];
    }
    return self;
}


- (void)setupSubviews
{
    self.underLineView = [[UIView alloc] init];
    self.underLineView.backgroundColor = COLOR_YELLOW;
    self.underLineView.layer.cornerRadius = 2;
    [self addSubview:self.underLineView];

}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.underLineView.frame = CGRectMake(self.itemWidth*3/8, self.height-lineHeight-3, self.itemWidth/4, lineHeight);
}

-(void)setTitles:(NSArray *)titles
{
    _titles = titles;
    _itemWidth = self.width/titles.count;
    for (int i = 0 ; i < titles.count ; i++)
    {
        UIButton * titleBtn = [[UIButton alloc] init];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(i*_itemWidth, 0, _itemWidth, self.height - 10);
        titleBtn.titleLabel.font = unSelectedFont;
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleBtn];
        [self.items addObject:titleBtn];
    }

    [self setDefaultBtn];
}

-(void)setDefaultBtn
{
    self.currentBtn = self.items.firstObject;
    self.currentBtn.titleLabel.font = selectedFont;

}

-(void)buttonAction:(UIButton *)sender
{
    //改字体大小
    self.currentBtn.titleLabel.font = unSelectedFont;
    NSInteger tag = sender.tag;
    self.currentBtn = self.items[tag];
    self.currentBtn.titleLabel.font = selectedFont;
    //改下划线位置

    [UIView animateWithDuration:0.3 animations:^{
        self.underLineView.frame = CGRectMake(self.itemWidth*3/8 + self.currentBtn.frame.origin.x, self.height-lineHeight-3, self.itemWidth/4, lineHeight);
    } completion:nil];


    if (self.switchBlock) {
        self.switchBlock(tag);
    }
}

-(void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    [self buttonAction:self.items[currentPage]];
}

-(NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}



@end
