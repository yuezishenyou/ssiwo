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

@interface MapManager ()<MAMapViewDelegate,AMapSearchDelegate>

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
    
    [self initSearch];
    
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

- (void)initSearch
{
    if (self.search) {
        self.search = nil;
        self.search.delegate = nil;
    }
    self.search = [[AMapSearchAPI alloc]init];
    self.search.delegate = self;
}
















//---------------------------------------------------------------------------
//MARK- method
//---------------------------------------------------------------------------

- (void)setLineStatus:(LineStatus)lineStatus
{
    _lineStatus = lineStatus;
    
    switch (lineStatus) {
        case LineStatusNomal:
        {
            
        }
            break;
            
        default:
            break;
    }
}


- (void)setRegeo:(CLLocationCoordinate2D)coor
{
    AMapReGeocodeSearchRequest *request = [[AMapReGeocodeSearchRequest alloc]init];
    
    request.location = [AMapGeoPoint locationWithLatitude:coor.latitude longitude:coor.longitude];
    
    request.requireExtension = YES;

    [self.search AMapReGoecodeSearch:request];//
    
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
    else if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
            annotationView.canShowCallout               = NO;
            annotationView.animatesDrop                 = NO;
            annotationView.draggable                    = NO;
            //annotationView.rightCalloutAccessoryView    = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            //annotationView.pinColor                     = [self.annotations indexOfObject:annotation] % 3;
        }
        annotationView.image = [UIImage imageNamed:@"userPosition"];
        NSString *title = annotation.title;
        if (title && [title isEqualToString:@"开始"])
        {
            annotationView.image = [UIImage imageNamed:@"on"];
        }
        else if (title && [title isEqualToString:@"结束"])
        {
            annotationView.image = [UIImage imageNamed:@"off"];
        }
        
        NSLog(@"--------abc-----------");
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



// 地图将要发生移动时调用此接口
- (void)mapView:(MAMapView *)mapView mapWillMoveByUser:(BOOL)wasUserAction
{
    if (self.lineStatus == LineStatusNomal) {
         NSLog(@"-----mapWillMoveByUser---------");
        
    }
}

// 地图移动结束后调用此接口
- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction
{
    if (self.lineStatus == LineStatusNomal) {
        NSLog(@"-----mapDidMoveByUser---------");
    }
}

// 地图区域即将改变时会调用此接口
- (void)mapView:(MAMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    
}

// 地图区域改变完成后会调用此接口
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"regionDidChangeAnimated");
    
    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
    
    [self setRegeo:centerCoordinate];

}











#pragma mark --------------------------- search Delegate -------------------------------------

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"-------didFailWithError----------");
}

/* 逆地理编码回调. */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode == nil) {
        return;
    }
    
    NSLog(@"-------(%@)----------",response.regeocode.formattedAddress);
    
}











@end
