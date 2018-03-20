//
//  MapManager.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "MapManager.h"

static NSString *userIdentifier = @"userIdentifier";
static NSString *startIdentifier = @"startIdentifier";

@interface MapManager ()<MAMapViewDelegate>

@property (nonatomic, weak) UIView *supView;
@property (nonatomic, weak) MAAnnotationView *userLocationAnnotationView;

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
        [self commonInit];
    }
    return self;
}







//---------------------------------------------------------------------------
//MARK- Init
//---------------------------------------------------------------------------
- (void)commonInit
{
    
}

//- (void)removeMap
//{
//    if (_mapView) {
//        _mapView.delegate = nil;
//        [_mapView removeFromSuperview];
//        _mapView = nil;
//    }
//}

- (void)removeMapView
{
    if (_mapView) {
        [_mapView removeFromSuperview];
        _mapView = nil;
        _mapView.delegate = nil;
    }
}

- (void)locateMapViewInView:(UIView *)supView frame:(CGRect)frame
{
    [self removeMapView];
    
    _mapView = [[MAMapView alloc]initWithFrame:frame];
    _mapView.delegate = self;
    _mapView.showsScale = NO;
    _mapView.showsCompass = NO;
    
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = MAUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
    _mapView.desiredAccuracy = kCLLocationAccuracyBest;
    _mapView.distanceFilter = 5.0f;
    _mapView.zoomLevel = 16.f;

    [supView addSubview:_mapView];
    [supView sendSubviewToBack:_mapView];

}





#pragma mark --------------------------- 两个神奇的方法 -------------------------------------
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAUserLocation class]])
    {
        MAAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:userIdentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAAnnotationView alloc]initWithAnnotation:annotation
                                                         reuseIdentifier:userIdentifier];
        }
        annotationView.canShowCallout = NO;
        annotationView.image = [UIImage imageNamed:@"userLocation"];
        self.userLocationAnnotationView = annotationView;
        return annotationView;
    }
    return nil;
}

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if (overlay == mapView.userLocationAccuracyCircle)
    {
        MACircleRenderer *accuracyCircleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];

        accuracyCircleRenderer.lineWidth    = 0.f;
        accuracyCircleRenderer.strokeColor  = [UIColor clearColor];
        accuracyCircleRenderer.fillColor    = [UIColor clearColor];
        
        return accuracyCircleRenderer;
    }
    return nil;
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if (!updatingLocation && self.userLocationAnnotationView != nil)
    {
        [UIView animateWithDuration:0.1 animations:^{
            
            double degree = userLocation.heading.trueHeading - self.mapView.rotationDegree;
            self.userLocationAnnotationView.transform = CGAffineTransformMakeRotation(degree * M_PI / 180.f );
            
        }];
    }
    //NSLog(@"-------(%.6f,%.6f)--------",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}





























@end
