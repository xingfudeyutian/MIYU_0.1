//
//  MIYUVirtualmoneyViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/30.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVirtualmoneyViewController.h"
#import "MIYUMoneyCell.h"


#define margin 15.0f
#define MoneyCell @"MIYUMoneyCell"



@interface MIYUVirtualmoneyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation MIYUVirtualmoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  

  self.automaticallyAdjustsScrollViewInsets = NO;
  self.edgesForExtendedLayout = UIRectEdgeNone;

//  self.collectionView.contentInset = UIEdgeInsetsMake(127, 0, 0,  -127-NavigationBarHeight-TabbarHeight);
  //2.填充图片View
//  UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, -127, FUll_VIEW_WIDTH, 127)];
//  topView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"placeholder.jpg"]];
//  topView.contentMode = UIViewContentModeScaleToFill;
//  [self.collectionView addSubview:topView];

  //    self.collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

  // 判断系统版本9.0以后才有这个功能
  //    if ([UIDevice currentDevice].systemVersion.floatValue >= 9.0) {
  //        // 当前组如果还在可视范围时让头部视图停留
  //        self.collectionViewFlowLayout.sectionHeadersPinToVisibleBounds = YES;
  //      }


  // 注册头部
//  UINib * headerNib = [UINib nibWithNibName:NSStringFromClass([MIYUNormalReusableView class]) bundle: [NSBundle mainBundle]];
//  [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
  //注册cell
  UINib * moneyNib = [UINib nibWithNibName:NSStringFromClass([MIYUMoneyCell class]) bundle: [NSBundle mainBundle]];
  [self.collectionView registerNib:moneyNib forCellWithReuseIdentifier:MoneyCell];



}
#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout

//item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (FUll_VIEW_WIDTH - 4*margin)/3;
    CGFloat height = 80*width/105;
    return CGSizeMake(width, height);
}
//纵向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
  return margin;
}
//横向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
  return margin;
}
//通过调整inset使单元格顶部和底部都有间距(inset次序: 上，左，下，右边)

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView
                         layout:(UICollectionViewLayout *)collectionViewLayout
         insetForSectionAtIndex:(NSInteger)section
{
  return UIEdgeInsetsMake(40.0f, margin, 0.0f, margin);
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//  return CGSizeMake(100, 60);
//}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell;
//  if (indexPath.section == 0)
//  {
//    cell = [collectionView dequeueReusableCellWithReuseIdentifier:RectID forIndexPath:indexPath];
//  }
//  else
//  {
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoneyCell forIndexPath:indexPath];
//  }
  return cell;
}

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//  if (kind == UICollectionElementKindSectionHeader) {
//    MIYUNormalReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID forIndexPath:indexPath];
//    @Weak(self)
//    headerView.reusableViewSelectBlock = ^{
//      @Strong(self)
////      [self reusableViewAction:indexPath.section];
//    };
//
//    return headerView;
//  }
//  return nil;
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
