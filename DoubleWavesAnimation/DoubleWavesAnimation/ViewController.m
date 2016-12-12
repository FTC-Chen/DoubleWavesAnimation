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

@interface ViewController ()

@property (nonatomic,strong)FirstWaves *firstWare;

@property (nonatomic,strong)SecondWaves *secondWare;

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
    

    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
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
