//
//  HHMainController.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHMainController.h"
#import "HHAnimateController.h"
#import "HHMyInfoController.h"
#import "DejFlickerView.h"
#import "DejActivityView.h"
#import "MapManager.h"




@interface HHMainController ()<UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL hasClick;//防止连点

@property (nonatomic, weak  ) HHAnimateController *animateController;

@property (nonatomic, strong) MAMapView *mapView;




@end

@implementation HHMainController

- (void)backClick
{
    // 防止重复点击
    if (self.hasClick) return;
    self.hasClick = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hasClick = NO;
    });
    
    // 展示个人中心
    HHAnimateController *vc = [[HHAnimateController alloc] init];
    vc.view.backgroundColor = [UIColor clearColor];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    self.animateController = vc;

}

- (void)rightClick
{
    HHMyInfoController *vc = [[HHMyInfoController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
    MapManager *manager = [MapManager manager];
    
    manager.controller = self;
    
    [manager showMap];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationController];


    
}














@end
