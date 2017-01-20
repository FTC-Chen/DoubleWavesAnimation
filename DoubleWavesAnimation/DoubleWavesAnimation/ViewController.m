//
//  ViewController.m
//  DoubleWavesAnimation
//
//  Created by anyongxue on 2016/12/12.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"

#import "FirstWaves.h"
#import "SecondWaves.h"

#import "MotionCurveViewController.h"

@interface ViewController ()

@property (nonatomic,strong)FirstWaves *firstWare;

@property (nonatomic,strong)SecondWaves *secondWare;

@property (nonatomic,strong)UIButton *jumpToMotionCurveBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //第一个波浪
    self.firstWare = [[FirstWaves alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 220)];
    
    self.firstWare.alpha=0.6;
    
    //第二个波浪
    self.secondWare = [[SecondWaves alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 220)];
    
    self.secondWare.alpha=0.6;
    
    [self.view addSubview:self.firstWare];
    
    [self.view addSubview:self.secondWare];
    

    //是否有震荡效果
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
  
    //  跳转至陀螺仪感应curve，波浪幅度跟随手机偏离水平方向幅度变化
    self.jumpToMotionCurveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    NSString *string = @"MotionCurve";
    CGSize size = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    self.jumpToMotionCurveBtn.frame = CGRectMake(self.view.bounds.size.width - 20 - size.width, (64 - size.height) / 2, size.width, size.height);
    [self.jumpToMotionCurveBtn setTitle:string forState:UIControlStateNormal];
    [self.jumpToMotionCurveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.jumpToMotionCurveBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.jumpToMotionCurveBtn addTarget:self action:@selector(jumpToMotionCurve) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.jumpToMotionCurveBtn];
}

-(void)jumpToMotionCurve{
    MotionCurveViewController *motionCurveVC = [[MotionCurveViewController alloc] init];
    [self presentViewController:motionCurveVC animated:YES completion:nil];
}

- (void)animateWave{
    

    [UIView animateWithDuration:1 animations:^{
        
        self.firstWare.transform = CGAffineTransformMakeTranslation(0, 20);
        
        self.secondWare.transform = CGAffineTransformMakeTranslation(0, 20);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            
            self.firstWare.transform = CGAffineTransformMakeTranslation(0, 0);
            
            self.secondWare.transform = CGAffineTransformMakeTranslation(0, 0);
            
        } completion:nil];
    
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
