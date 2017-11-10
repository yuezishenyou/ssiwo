//
//  UIView+animated.h
//  HHSpring
//
//  Created by maoziyue on 2017/10/31.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AnimationMode) {
    AnimationModeDown = 0,      //由上往下
    AnimationModeUp,        //由下往上
    AnimationModeLeft,      //由右往左
    AnimationModeRight,      //由左往右
    AnimationModeDDLeft,
    AnimationModeDDRight,
};


@interface UIView (animated)

-(void)showInView:(UIView *)view animationMode:(AnimationMode)animationMode;

-(void)hiddenWithAnimationMode:(AnimationMode)animationMode;



@end
