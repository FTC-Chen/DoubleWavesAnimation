//
//  ViewController.m
//  DoubleWavesAnimation
//
//  Created by anyongxue on 2016/12/3.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"

#import "DWavesView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DWavesView *waterView = [[DWavesView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:waterView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
