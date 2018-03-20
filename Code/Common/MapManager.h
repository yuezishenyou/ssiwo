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

+ (instancetype)manager;

- (void)locateMapViewInView:(UIView *)supView frame:(CGRect)frame;

- (void)removeMapView;


@end
