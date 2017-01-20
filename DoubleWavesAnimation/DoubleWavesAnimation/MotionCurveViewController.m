//
//  MotionCurveViewController.m
//  DoubleWavesAnimation
//
//  Created by 宋晓光 on 20/01/2017.
//  Copyright © 2017 cc. All rights reserved.
//

#import "MotionCurveViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "MotionCurveView.h"

@interface MotionCurveViewController ()

@property(nonatomic,strong) UIButton *jumpBackBtn;

@property(nonatomic,strong) CMMotionManager *motionManager;

@property(nonatomic,strong) MotionCurveView *motionCurveView;

@end

@implementation MotionCurveViewController

-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
  //  设置MotionManager参数
  self.motionManager = [[CMMotionManager alloc] init];
  self.motionManager.deviceMotionUpdateInterval = 1.0 / 60.0;
  [self.motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXArbitraryZVertical];
  
  //  开启陀螺仪数据获取
  [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateDeviceMotion) userInfo:nil repeats:YES];
}

-(void)updateDeviceMotion{
  CMDeviceMotion *deviceMotion = self.motionManager.deviceMotion;
  if (deviceMotion == nil) {
    return;
  }
  //  获取z轴旋转角度
  CMAttitude *attitude = deviceMotion.attitude;
  float yaw = attitude.yaw;
  
  //  调整振幅
  [self.motionCurveView updateWithYaw:yaw];
}

-(void)viewWillDisappear:(BOOL)animated{
  //  关闭陀螺仪数据获取
  [self.motionManager stopDeviceMotionUpdates];
  self.motionManager = nil;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  //  motion curve view
  self.motionCurveView = [[MotionCurveView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
  [self.view addSubview:self.motionCurveView];
  
  //  跳转至陀螺仪感应curve
  self.jumpBackBtn = [UIButton buttonWithType:UIButtonTypeSystem];
  NSString *string = @"Back";
  CGSize size = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
  self.jumpBackBtn.frame = CGRectMake(20, (64 - size.height) / 2, size.width, size.height);
  [self.jumpBackBtn setTitle:string forState:UIControlStateNormal];
  [self.jumpBackBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  self.jumpBackBtn.titleLabel.font = [UIFont systemFontOfSize:17];
  [self.jumpBackBtn addTarget:self action:@selector(jumpBack) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.jumpBackBtn];
}

-(void)jumpBack{
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
