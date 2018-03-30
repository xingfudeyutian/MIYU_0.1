//
//  MIYUBaseSquareCollectionController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/26.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseSquareCollectionController.h"
#import "MIYUShowSquareCell.h"
#import "MIYURectangleCell.h"
#import "MIYUVideoCell.h"

#import "MIYUVideoShowViewController.h"

#define VideoCellID @"MIYUVideoCell"
#define SquareID @"MIYUShowSquareCell"
#define RectangleID @"MIYURectangleCell"
#define margin 10.0f


@interface MIYUBaseSquareCollectionController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MIYUBaseSquareCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;

}

-(void)setupSubViews
{
    [super setupSubViews];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Register cell classes
    //注册cell
    UINib * squareNib = [UINib nibWithNibName:NSStringFromClass([MIYUShowSquareCell class]) bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib:squareNib forCellWithReuseIdentifier:SquareID];

    UINib * rectangleNib = [UINib nibWithNibName:NSStringFromClass([MIYURectangleCell class]) bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib:rectangleNib forCellWithReuseIdentifier:RectangleID];

    UINib * videoNib = [UINib nibWithNibName:NSStringFromClass([MIYUVideoCell class]) bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib:videoNib forCellWithReuseIdentifier:VideoCellID];
}
//item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  CGFloat width;
  CGFloat height;
    if (self.cellType == MIYUCELLTYPE_RECTAGLE) {
      return CGSizeMake(FUll_VIEW_WIDTH - 2* margin, 70);
    }else
    {
      width = (FUll_VIEW_WIDTH - 3*margin)/2;
      height = 225*width/172;
    }
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
    return UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(FUll_VIEW_WIDTH, 60);
//}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

  return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

  return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  MIYUBaseCollectionViewCell * cell;
    if (self.cellType == MIYUCELLTYPE_RECTAGLE) {

      cell = [collectionView dequeueReusableCellWithReuseIdentifier:RectangleID forIndexPath:indexPath];
      return cell;
    }else if (self.cellType == MIYUCELLTYPE_SQUARE)
    {
      cell = [collectionView dequeueReusableCellWithReuseIdentifier:SquareID forIndexPath:indexPath];
    }else
    {
      cell = [collectionView dequeueReusableCellWithReuseIdentifier:VideoCellID forIndexPath:indexPath];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUBaseViewController * vc;

  if (self.cellType == MIYUCELLTYPE_VIDEO)
  {
    vc = [[MIYUVideoShowViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
  }

  [self.parentVC.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 

@end
