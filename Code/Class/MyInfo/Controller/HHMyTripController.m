//
//  HHMyTripController.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHMyTripController.h"
#import "MapManager.h"

@interface HHMyTripController ()

@end

@implementation HHMyTripController

- (void)backClick
{
    MapManager *manager = [MapManager manager];
    
    [manager.mapView removeFromSuperview];
    manager.mapView = nil;
    
    //[manager locateMapViewInView:self.view frame:self.view.bounds];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的行程";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"dd" style:UIBarButtonItemStyleDone target:self action:@selector(dddddd)];
    
    MapManager *manager = [MapManager manager];
    
    
    [self.view addSubview:manager.mapView];
    [self.view sendSubviewToBack:manager.mapView];

    
    
    //[manager locateMapViewInView:self.view frame:self.view.bounds];
    
}

- (void)dddddd
{
    if (_dddddBlock) {
        _dddddBlock(@"mao");
    }
}









@end
