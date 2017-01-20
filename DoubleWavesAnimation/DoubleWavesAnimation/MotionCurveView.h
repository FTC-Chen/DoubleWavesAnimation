//
//  MotionCurveView.h
//  DoubleWavesAnimation
//
//  Created by 宋晓光 on 20/01/2017.
//  Copyright © 2017 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MotionCurveView : UIView

//  根据motion数据调整振幅
-(void)updateWithYaw:(CGFloat)yaw;

@end
