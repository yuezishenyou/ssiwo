//
//  MapManager.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "MapManager.h"

@interface MapManager ()

@property (nonatomic, weak) UIView *supView;


@end


@implementation MapManager

+ (instancetype)manager
{
    static MapManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manager == nil) {
            _manager = [[MapManager alloc]init];
        }
    });
    return _manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)showMap
{
    if (_mapView) {
        _mapView.delegate = nil;
        [_mapView removeFromSuperview];
        _mapView = nil;
    }
    
    _mapView = [[MAMapView alloc]initWithFrame:self.controller.view.bounds];
    [self.controller.view addSubview:_mapView];
    [self.controller.view sendSubviewToBack:_mapView];
    //_mapView.delegate = self;
    _mapView.showsScale = NO;
    _mapView.showsCompass = NO;
    
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = MAUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
    _mapView.desiredAccuracy = kCLLocationAccuracyBest;
    _mapView.distanceFilter = 5.0f;
}

- (void)removeMap
{
    if (_mapView) {
        _mapView.delegate = nil;
        [_mapView removeFromSuperview];
        _mapView = nil;
    }
}










- (void)locateMapWithController:(UIViewController *)vc frame:(CGRect)frame
{
    if (_mapView) {
        _mapView.delegate = nil;
        [_mapView removeFromSuperview];
        _mapView = nil;
    }
    
    _mapView = [[MAMapView alloc]initWithFrame:frame];
    [vc.view addSubview:_mapView];
    [vc.view sendSubviewToBack:_mapView];
    //_mapView.delegate = self;
    _mapView.showsScale = NO;
    _mapView.showsCompass = NO;
    
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = MAUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
    _mapView.desiredAccuracy = kCLLocationAccuracyBest;
    _mapView.distanceFilter = 5.0f;
}



- (void)locateMapViewInView:(UIView *)mapSuerView frame:(CGRect)frame
{
    //[self initSearch];
    
    //[self initDriveManager];
    
    [self initMapViewWithSupView:mapSuerView frame:frame];
    
    self.supView = mapSuerView;
}

- (BOOL)initMapViewWithSupView:(UIView *)mapSuerView frame:(CGRect)frame
{
    
    if (_mapView) {
        [_mapView removeFromSuperview];
        _mapView = nil;
    }
    
    _mapView.delegate = nil;
    _mapView.showsUserLocation = NO;
    
    _mapView = [[MAMapView alloc]initWithFrame:frame];
    [mapSuerView addSubview:_mapView];
    [mapSuerView sendSubviewToBack:_mapView];
    //_mapView.delegate = self;
    _mapView.showsScale = NO;
    _mapView.showsCompass = NO;
    
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = MAUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
    _mapView.desiredAccuracy = kCLLocationAccuracyBest;
    _mapView.distanceFilter = 5.0f;
    
    return YES;
}


































@end
