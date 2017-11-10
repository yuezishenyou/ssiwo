//
//  UIView+animated.m
//  HHSpring
//
//  Created by maoziyue on 2017/10/31.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "UIView+animated.h"
#import <objc/runtime.h>

#define TagValue  3333
#define ALPHA  0.2 //背景
#define AlertTime 0.25 //弹出动画时间
#define DropTime 0.25 //落下动画时间


static CGFloat  v_X;
static CGFloat  v_Y;
static CGFloat  v_W;
static CGFloat  v_H;
static CGFloat  kW;
static CGFloat  kH;

@implementation UIView (animated)
static AnimationMode mode;

-(void)showInView:(UIView *)view animationMode:(AnimationMode)animationMode
{
    //self.dejNoNetworkView = view;
    v_X = self.frame.origin.x;
    v_Y = self.frame.origin.y;
    v_W = self.frame.size.width;
    v_H = self.frame.size.height;
    kW = [[UIScreen mainScreen]bounds].size.width;
    kH = [[UIScreen mainScreen]bounds].size.height;
    
    mode = animationMode;
    
    [self keyBoardListen];
    
    switch (animationMode)
    {
        case AnimationModeDown:
            [self slideDownShow:view];
            break;
        case AnimationModeUp:
            [self slideUpShow:view];
            break;
        case AnimationModeLeft:
            [self slideLeftShow:view];
            break;
        case AnimationModeRight:
            [self slideRightShow:view];
            break;
        case AnimationModeDDLeft:
            [self slideDDLeftShow:view];
            break;
        case AnimationModeDDRight:
            [self slideDDRightShow:view];
            break;
            
        default:
            break;
    }
}


-(void)hiddenWithAnimationMode:(AnimationMode)animationMode
{
    [self removeKeyBoardListen];
    
    switch (animationMode)
    {
        case AnimationModeDown:
            [self slideDownHidden];
            break;
        case AnimationModeUp:
            [self slideUpHidden];
            break;
        case AnimationModeLeft:
            [self slideLeftHidden];
            break;
        case AnimationModeRight:
            [self slideRightHidden];
            break;
        case AnimationModeDDLeft:
            [self slideDDLeftHidden];
            break;
        case AnimationModeDDRight:
            [self slideDDRightHidden];
            break;
            
        default:
            break;
    }
}





//-----------------------------------------------------------------
//--Show and Hidden
//-----------------------------------------------------------------
- (void)slideDDRightShow:(UIView *)view
{
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    [view addSubview:self];
    
    self.frame = CGRectMake(-kW, v_Y, v_W, v_H);
    self.alpha = 1.0;
    
    [UIView animateWithDuration:DropTime animations:^{
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)slideDDRightHidden
{
    if (self.superview)
    {
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:DropTime animations:^{
            self.frame = CGRectMake(kW, v_Y, v_W, v_H);
        } completion:^(BOOL finished) {
            self.alpha = 0.0;
            self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
            [self hideAnimationFinish];
        }];
    }
}


- (void)slideDDLeftShow:(UIView *)view
{
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    [view addSubview:self];
    
    self.frame = CGRectMake(kW, v_Y, v_W, v_H);
    self.alpha = 1.0;
    
    [UIView animateWithDuration:DropTime animations:^{
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
    } completion:^(BOOL finished) {
        
    }];
    

}

- (void)slideDDLeftHidden
{
    if (self.superview)
    {
        
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:DropTime animations:^{
            self.frame = CGRectMake(-kW, v_Y, v_W, v_H);
        } completion:^(BOOL finished) {
            self.alpha = 0.0;
            self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
            [self hideAnimationFinish];
        }];
    }
}


- (void)slideRightShow:(UIView *)view
{
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    [view addSubview:self];
    
    self.frame = CGRectMake(0, v_Y, v_W, v_H);
    self.alpha = 1.0;
    
    [UIView animateWithDuration:DropTime delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)slideRightHidden
{
    if (self.superview)
    {
        
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:DropTime animations:^{
            self.frame = CGRectMake(kW, v_Y, v_W, v_H);
        } completion:^(BOOL finished) {
            self.alpha = 0.0;
            self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
            [self hideAnimationFinish];
        }];
    }
}



//left
- (void)slideLeftShow:(UIView *)view
{
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    [view addSubview:self];

    self.frame = CGRectMake(kW, v_Y, v_W, v_H);
    self.alpha = 1.0;
    
    [UIView animateWithDuration:DropTime delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)slideLeftHidden
{
    if (self.superview)
    {
        
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:DropTime animations:^{
            self.frame = CGRectMake(-v_W, v_Y, v_W, v_H);
        } completion:^(BOOL finished) {
            self.alpha = 0.0;
            self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
            [self hideAnimationFinish];
        }];
        
    }
}


//up
- (void)slideUpShow:(UIView *)view
{
    if (self.superview) {
        [self removeFromSuperview];
    }

    [view addSubview:self];

    self.frame = CGRectMake(v_X, kH, v_W, v_H);
    self.alpha = 1.0;
    
    [UIView animateWithDuration:DropTime delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)slideUpHidden
{
    if (self.superview)
    {
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:DropTime animations:^{
            self.frame = CGRectMake(v_X, -v_H, v_W, v_H);
        } completion:^(BOOL finished) {
            self.alpha = 0.0;
            self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
            [self hideAnimationFinish];
        }];
    }
}




//down
-(void)slideDownShow:(UIView *)view
{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInView:view];
    [view addSubview:self];
    CGFloat x = v_X;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
    self.alpha = 1.0;
    
    [UIView animateWithDuration:DropTime delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = CGRectMake(v_X, v_Y, width, height);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)slideDownHidden
{
    if (self.superview)
    {
        self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:DropTime animations:^{
            self.frame = CGRectMake(self.frame.origin.x, [UIApplication sharedApplication].keyWindow.bounds.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            self.alpha = 0.0;
            self.frame = CGRectMake(v_X, v_Y, v_W, v_H);
            [self hideAnimationFinish];
        }];
    }
}


-(void)hideAnimationFinish
{
    [self removeFromSuperview];
}

























//-----------------------------------------------------------------
//-- 以下暂时没用
//-----------------------------------------------------------------

-(void)addViewInView:(UIView *)view
{
//    UIView *oldView = [view viewWithTag:TagValue];
//    if (oldView) {
//        [oldView removeFromSuperview];
//    }
    
    
//    UIView *v = [[UIView alloc] initWithFrame:view.bounds];
//    v.tag = TagValue;
//    [self addGuesture:v];
    
    //v.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.5];
    
    //v.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:bgAlpha == -1 ? ALPHA : bgAlpha];
    
//    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//
//    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//
//    effectView.frame = v.bounds;
//
//    [v addSubview:effectView];
    
    
//    [view addSubview:v];
    
    
}

//添加背景view手势
-(void)addGuesture:(UIView *)vi
{
    //背景不加点击手势
    
//    vi.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
//    [vi addGestureRecognizer:tap];
    
}





















































#pragma mark - 键盘弹起监听
- (void)keyBoardListen {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)removeKeyBoardListen{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary *userInfo = [noti userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;  // 得到键盘弹出后的键盘视图所在y坐标;
    if (CGRectGetMaxY(self.frame)>=keyBoardEndY) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect _frame = self.frame;
            _frame.origin.y = keyBoardEndY-_frame.size.height-10;
            self.frame = _frame;
        }];
    }
    
}

- (void)keyboardWillHide:(NSNotification *)noti {
    [UIView animateWithDuration:0.5 animations:^{
        self.center = [UIApplication sharedApplication].keyWindow.center;
    }];
}













@end
