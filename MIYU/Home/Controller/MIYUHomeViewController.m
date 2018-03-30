//
//  MIYUHomeViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUHomeViewController.h"
#import "MIYURecommendViewController.h"
#import "MIYUBaseSquareCollectionController.h"
#import "MIYUBaseSwitchView.h"


@interface MIYUHomeViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) MIYUBaseSwitchView * switchView;
@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, strong) NSArray * contentViewControllers;
@property (nonatomic, strong) UIView * currentView;

@property (nonatomic, strong) UIScrollView * scrollTabView;
@property (nonatomic, strong) UIPageControl * pageControl;



@end

@implementation MIYUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    @Weak(self)
    self.switchView.switchBlock = ^(NSInteger tag) {
        @Strong(self)
        self.pageControl.currentPage = tag;
        [self pageControlValueChange:self.pageControl];
    };
    self.navigationItem.titleView = self.switchView;
    [self.view addSubview:self.scrollTabView];
    [self.view addSubview:self.pageControl];


    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"filter"] style:UIBarButtonItemStylePlain target:self action:@selector(filterShow)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchShow)];

}
#pragma mark -- UIScrollViewDelegate
//实现协议UIScrollViewDelegate的方法，必须实现的
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前视图的宽度
    CGFloat pageWith = scrollView.frame.size.width;
    //根据scrolView的左右滑动,对pageCotrol的当前指示器进行切换(设置currentPage)
    int page = floor((scrollView.contentOffset.x - pageWith/2)/pageWith)+1;
    //切换改变页码，小圆点
    self.pageControl.currentPage = page;
    self.switchView.currentPage = page;
}

#pragma mark - UIPageControl
- (void)pageControlValueChange:(UIPageControl *)pageControl {

    NSLog(@"%ld", pageControl.currentPage);  // 根据当前页的不同的值, 可以实现不同的功能

    [UIView animateWithDuration:0.3 animations:^{
        //根据当前的页数。是的scrollView也滑动到对应的子视图。通过设置scrollView的contentOffSet来实现（改变contentOffSet实际上就是改变scrollView的bounds）
        //得到当前的页数
        int page = (int)pageControl.currentPage;
        //根据当前页数来计算偏移量
        //step1:得到scrollView
//        UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:1000];
        //step2:设置scrollView的偏移量---当前的页数乘以屏幕宽度
        [self.scrollTabView setContentOffset:CGPointMake(page*CGRectGetWidth(self.view.frame), 0) animated:YES];
    } completion:nil];
}

- (void)filterShow
{



}

- (void)searchShow
{


}


#pragma mark - Lazy loading


-(NSArray *)titles
{
    if (_titles==nil)
    {
        _titles = @[@"推荐",@"新人",@"附近"];
    }
    return _titles;
}

-(UIScrollView *)scrollTabView
{
    if (_scrollTabView == nil)
    {
        _scrollTabView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT)];
        _scrollTabView.pagingEnabled = YES;
        _scrollTabView.contentSize = CGSizeMake(FUll_VIEW_WIDTH*self.contentViewControllers.count, FUll_VIEW_HEIGHT);
        _scrollTabView.bouncesZoom = NO;
        _scrollTabView.delegate = self;
        _scrollTabView.bounces = NO;
        _scrollTabView.showsHorizontalScrollIndicator = NO;//控制是否显示水平方向的滚动条
        _scrollTabView.showsVerticalScrollIndicator  = NO;     //控制是否显示垂直方向的滚动条
        _scrollTabView.alwaysBounceVertical   = NO;        //控制垂直方向遇到边框是否反弹
        _scrollTabView.alwaysBounceHorizontal = NO;      //控制水平方向遇到边框是否反弹
    }
    return _scrollTabView;
}


-(MIYUBaseSwitchView *)switchView
{
    if (_switchView == nil)
    {
        _switchView = [[MIYUBaseSwitchView alloc] init];
        _switchView.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH-130, TabbarHeight);
        _switchView.titles = self.titles;
//        _switchView.backgroundColor = [UIColor whiteColor];
        for (int i = 0; i < self.contentViewControllers.count; i++)
        {
            UIViewController * vc = self.contentViewControllers[i];
            vc.view.frame = CGRectMake(i*FUll_VIEW_WIDTH, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT);
            [self.scrollTabView addSubview:vc.view];
        }
    }
    return _switchView;
}

-(UIPageControl *)pageControl
{
    if (_pageControl == nil)
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = self.contentViewControllers.count;
        [_pageControl addTarget:self action:@selector(pageControlValueChange:) forControlEvents:UIControlEventValueChanged];
//        _pageControl.backgroundColor = [UIColor redColor];
        _pageControl.hidden = YES;
    }
    return _pageControl;
}

-(NSArray *)contentViewControllers
{
    if (_contentViewControllers == nil)
    {

        MIYURecommendViewController * recommendVC =  [[MIYURecommendViewController  alloc] init];
        recommendVC.superViewController = self;
        MIYUBaseSquareCollectionController * newVC = [[MIYUBaseSquareCollectionController alloc] init];
        newVC.parentVC = self;
        MIYUBaseSquareCollectionController * squareVC = [[MIYUBaseSquareCollectionController alloc] init];
        squareVC.parentVC = self;
        _contentViewControllers = @[
                            recommendVC,
                             newVC,
                             squareVC,
                             ];
    }
    return _contentViewControllers;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
