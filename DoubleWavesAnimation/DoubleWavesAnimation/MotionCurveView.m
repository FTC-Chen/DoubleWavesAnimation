//
//  MotionCurveView.m
//  DoubleWavesAnimation
//
//  Created by 宋晓光 on 20/01/2017.
//  Copyright © 2017 cc. All rights reserved.
//

#import "MotionCurveView.h"

#define kWaveA 10
#define kWaveW 0.5 / 30
#define kWaveC 0

@interface MotionCurveView()

@property(nonatomic,strong) CAShapeLayer *curveLayer;

@property(nonatomic,assign) NSInteger timeCount;

@property(nonatomic,assign) CGFloat waveA;

@end

@implementation MotionCurveView

-(instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    self.waveA = kWaveA;
    [self drawCurveAnimation];
  }
  return self;
}

-(void)drawCurveAnimation{
  //  设置shapeLayer属性
  self.curveLayer = [CAShapeLayer layer];
  self.curveLayer.frame = self.layer.bounds;
  self.curveLayer.strokeColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1].CGColor;
  self.curveLayer.fillColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1].CGColor;
  self.curveLayer.lineWidth = 1;
  [self.layer addSublayer:self.curveLayer];
  //  开始动画
  self.timeCount = 0;
  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveCurve) userInfo:nil repeats:YES];
}

-(void)moveCurve{
  self.curveLayer.path = [self sinCurveWithA:self.waveA w:kWaveW fi:self.timeCount++ c:kWaveC].CGPath;
}

-(UIBezierPath *)sinCurveWithA:(CGFloat)a w:(CGFloat)w fi:(CGFloat)fi c:(CGFloat)c{
  UIBezierPath *path = [UIBezierPath bezierPath];
  [path moveToPoint:CGPointMake(0, self.bounds.size.height)];
  for (int i = 0; i < self.bounds.size.width; i++) {
    CGPoint point = CGPointMake(i ,a * sin(i * w + fi) + c + self.bounds.size.height);
    [path addLineToPoint:point];
  }
  [path addLineToPoint:CGPointMake(self.bounds.size.width, 0)];
  [path addLineToPoint:CGPointMake(0, 0)];
  [path closePath];
  return path;
}

-(void)updateWithYaw:(CGFloat)yaw{
  //  根据motion数据调整振幅
  self.waveA = yaw * kWaveA;
}


@end
