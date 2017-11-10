//
//  MapManager.h
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapManager : NSObject

@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) AMapSearchAPI *search;

@property (nonatomic, strong) AMapNaviDriveManager *driveManager;

@property (nonatomic, weak) UIViewController *controller;

+ (instancetype)manager;

- (void)locateMapViewInView:(UIView *)mapSuerView
                      frame:(CGRect)frame;

- (void)locateMapWithController:(UIViewController *)vc frame:(CGRect)frame;

- (void)showMap;

- (void)removeMap;



@end
