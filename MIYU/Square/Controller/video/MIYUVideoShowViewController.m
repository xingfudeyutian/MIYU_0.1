//
//  MIYUVideoShowViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoShowViewController.h"
#import "MIYUVideoToolView.h"


#import "MIYUBarrageViewController.h"


#define VideoToolHeight 70

@interface MIYUVideoShowViewController ()<ZFPlayerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGRect keyboardFrame;
/** 视频URL */
@property (nonatomic, strong) NSURL *videoURL;

@property (weak, nonatomic) IBOutlet UIView *playerFatherView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIView *playerControlView;
@property (strong, nonatomic) ZFPlayerView *playerView;
/** 离开页面时候是否在播放 */
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, strong) ZFPlayerModel *playerModel;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) MIYUVideoToolView * videoTool;

@property (nonatomic, strong) MIYUBarrageViewController * barrageController;

@end

@implementation MIYUVideoShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.videoURL = [NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_03.mp4"];
  // 自动播放，默认不自动播放
  [self.playerView autoPlayTheVideo];
  /**
   *  添加两个键盘回收通知
   */
  // 即将隐藏

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  // 键盘的Frame值即将发生变化的时候创建的额监听
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.navigationController.navigationBar setHidden:YES];
  // pop回来时候是否自动播放
  if (self.navigationController.viewControllers.count == 2 && self.playerView && self.isPlaying) {
    self.isPlaying = NO;
    self.playerView.playerPushedOrPresented = NO;
  }
}
-(void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [self.navigationController.navigationBar setHidden:NO];
  // push出下一级页面时候暂停
  if (self.navigationController.viewControllers.count == 3 && self.playerView && !self.playerView.isPauseByUser)
  {
    self.isPlaying = YES;
    //        [self.playerView pause];
    self.playerView.playerPushedOrPresented = YES;
  }
}
#pragma mark - ZFPlayerDelegate

- (void)zf_playerBackAction {
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)zf_playerDownload:(NSString *)url {
  // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
  NSString *name = [url lastPathComponent];

  [[ZFDownloadManager sharedDownloadManager] downFileUrl:url filename:name fileimage:nil];
  // 设置最多同时下载个数（默认是3）
  [ZFDownloadManager sharedDownloadManager].maxCount = 4;
}

- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
  //    self.backBtn.hidden = YES;
  [UIView animateWithDuration:0.25 animations:^{
    self.backBtn.alpha = 0;
  }];
}

- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
  //    self.backBtn.hidden = fullscreen;
  [UIView animateWithDuration:0.25 animations:^{
    self.backBtn.alpha = !fullscreen;
  }];
}

#pragma mark - Getter

- (ZFPlayerModel *)playerModel {
  if (!_playerModel) {
    _playerModel                  = [[ZFPlayerModel alloc] init];
    _playerModel.title            = @"这里设置视频标题";
    _playerModel.videoURL         = self.videoURL;
    _playerModel.placeholderImage = [UIImage imageNamed:@"loading_bgView1"];
    _playerModel.fatherView       = self.playerFatherView;
//            _playerModel.resolutionDic = @{@"高清" : self.videoURL.absoluteString,
    //                                       @"标清" : self.videoURL.absoluteString};
  }
  return _playerModel;
}

- (ZFPlayerView *)playerView {
  if (!_playerView) {
    _playerView = [[ZFPlayerView alloc] init];

    /*****************************************************************************************
     *   // 指定控制层(可自定义)
     *   // ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
     *   // 设置控制层和播放模型
     *   // 控制层传nil，默认使用ZFPlayerControlView(如自定义可传自定义的控制层)
     *   // 等效于 [_playerView playerModel:self.playerModel];
     ******************************************************************************************/
    [self.playerControlView addSubview:self.videoTool];
    
    [self.playerControlView addSubview:self.barrageController.view];
    [self addChildViewController:self.barrageController];
    [_playerView playerControlView:self.playerControlView playerModel:self.playerModel];

    // 设置代理
    _playerView.delegate = self;

    //（可选设置）可以设置视频的填充模式，内部设置默认（ZFPlayerLayerGravityResizeAspect：等比例填充，直到一个维度到达区域边界）
     _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspectFill;

    // 打开下载功能（默认没有这个功能）
    _playerView.hasDownload    = YES;

    // 打开预览图
    _playerView.hasPreviewView = YES;

    //        _playerView.forcePortrait = YES;
    /// 默认全屏播放
    //        _playerView.fullScreenPlay = YES;

  }
  return _playerView;
}

-(MIYUBarrageViewController *)barrageController
{
  if (_barrageController == nil)
  {
    _barrageController = [[MIYUBarrageViewController alloc] init];
    [_barrageController.view setFrame:CGRectMake(0, FUll_VIEW_HEIGHT/3, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT/3)];
  }
  return _barrageController;
}
-(MIYUVideoToolView *)videoTool
{
  if (_videoTool == nil) {
    _videoTool = [MIYUVideoToolView viewFromXIB];
    _videoTool.frame = CGRectMake(0, FUll_VIEW_HEIGHT-VideoToolHeight, FUll_VIEW_WIDTH, VideoToolHeight);
 
  }
  return _videoTool;
}

- (IBAction)backClick:(UIButton *)sender {

  [self.navigationController popViewControllerAnimated:YES];
}
// 返回值要必须为NO
- (BOOL)shouldAutorotate {
  return NO;
}

- (IBAction)controlViewTapGesture:(UITapGestureRecognizer *)sender {
    [self.videoTool resignFirstResponder];
}
#pragma mark - Private Methods

- (void)keyboardWillHide:(NSNotification *)notification{

  self.keyboardFrame = CGRectZero;
  [UIView animateWithDuration:0.3 animations:^{
    self.videoTool.bottom = self.playerControlView.bottom;
  }];


}


/**
 *  点击了 textView 的时候，这个方法的调用是比  - (void) textViewDidBeginEditing:(UITextView *)textView 要早的。

 */
- (void)keyboardFrameWillChange:(NSNotification *)notification{

  self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  if (self.keyboardFrame.size.height>VideoToolHeight) {
    [UIView animateWithDuration:0.3 animations:^{

       self.videoTool.bottom = self.playerControlView.bottom - self.keyboardFrame.size.height ;
    }];

  }
}


- (void)dealloc{
  /**
   *  移除键盘通知
   */
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

 

@end
