//
//  HHMyInfoController.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHMyInfoController.h"
#import "MapManager.h"


@interface HHMyInfoController ()



@end

@implementation HHMyInfoController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    MapManager *manager = [MapManager manager];
    
    manager.controller = nil;
    
    [manager removeMap];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"子控制器";
    
    [self setMap];
}

- (void)setMap
{
    MapManager *manager = [MapManager manager];
    
    manager.controller = self;
    
    [manager showMap];
}


@end
