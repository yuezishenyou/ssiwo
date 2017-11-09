//
//  HHAMapHelper.m
//  ssiswo
//
//  Created by maoziyue on 2017/9/7.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHAMapHelper.h"

#define RANGEOFRADIUS  (1000)

@interface HHAMapHelper ()<MAMapViewDelegate,AMapSearchDelegate,AMapNaviWalkManagerDelegate,AMapNaviWalkViewDelegate,AMapNaviDriveViewDelegate,AMapNaviDriveManagerDelegate>





@end

@implementation HHAMapHelper




- (void)locateMapViewInView:(UIView *)mapSuerView frame:(CGRect)frame
{
    
    [self initSearch];
    
    [self initDriveManager];
    
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
    _mapView.delegate = self;
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

- (BOOL)initSearch
{
    if (_search) {
        _search = nil;
    }
    
    _search.delegate = nil;
    
    _search = [[AMapSearchAPI alloc]init];
    _search.delegate = self;
    
    return YES;
}

- (BOOL)initDriveManager
{
    if (_driveManager)
    {
        _driveManager = nil;
    }
    _driveManager.delegate = nil;
    
    _driveManager = [[AMapNaviDriveManager alloc] init];
    _driveManager.delegate = self;
    
    return YES;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _mapView.delegate = self;
    _search.delegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    _mapView.delegate = nil;
    _search.delegate = nil;
}







- (void)viewDidDeallocOrReceiveMemoryWarning
{
    _mapView.showsUserLocation = NO;
    _mapView.delegate = nil;
    [_mapView removeFromSuperview];
    _mapView = nil;
    
    _search.delegate = nil;
    _search = nil;
    
}

- (void)dealloc
{
    [self viewDidDeallocOrReceiveMemoryWarning];
    NSLog(@"------help释放-------");
}

















// ----------------------------------------------------------------------------------------
// MARK: - 大头针生成
// ----------------------------------------------------------------------------------------

#pragma mark -----------大头针生成-------------
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MAUserLocation class]])
    {//定位点
        static NSString *transparentuserLocationStyleReuseIndetifier = @"asuserLocationStyleReuseIndetifier1";
        MAAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:transparentuserLocationStyleReuseIndetifier];
        if (annotationView == nil){
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation
                                                             reuseIdentifier:transparentuserLocationStyleReuseIndetifier];
            UIImage *userLocation;
            userLocation = [UIImage imageNamed:@"scheduellist_end_icon"];
            annotationView.image = userLocation;
            annotationView.zIndex = 1;
        }
        
        return annotationView;
    }
    return nil;
}

#pragma mark -----------画线活着添加蒙版-------------
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    NSLog(@"------------ 在地图上画线 ------------------");
    /* 自定义定位精度对应的MACircleView. */
    if (overlay == mapView.userLocationAccuracyCircle)
    {
        MACircleRenderer *accuracyCircleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        
        accuracyCircleRenderer.lineWidth    = 2.f;
        accuracyCircleRenderer.strokeColor  = [UIColor clearColor];
        accuracyCircleRenderer.fillColor    = [UIColor clearColor];
        
        return accuracyCircleRenderer;
    }
    
    return nil;
}













// ----------------------------------------------------------------------------------------
// MARK: - 用户定位
// ----------------------------------------------------------------------------------------

#pragma mark ---------用户定位信息---------

- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"------定位用户位置失败------");
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"------lat:%f,lon:%f------",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
    self.currentLocation = [userLocation.location copy];
    
}

- (void)setCurrentLocation:(CLLocation *)currentLocation
{
    if (_currentLocation == nil) {
        _currentLocation = currentLocation;
        
        MACoordinateRegion reg = MACoordinateRegionMakeWithDistance(_mapView.centerCoordinate, RANGEOFRADIUS, RANGEOFRADIUS);
        [_mapView setRegion:reg animated:NO];
        [_mapView setCenterCoordinate:currentLocation.coordinate];
    }
}

















// ----------------------------------------------------------------------------------------
// MARK: - 查询、请求
// ----------------------------------------------------------------------------------------

#pragma mark ---------查询、请求----------------
- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    if (self.reGeocodeSearchRequest == nil)
    {
        self.reGeocodeSearchRequest = [[AMapReGeocodeSearchRequest alloc] init];
    }
    self.reGeocodeSearchRequest.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    self.reGeocodeSearchRequest.requireExtension = YES;
    self.reGeocodeSearchRequest.radius = 10000;
    
    [self.search AMapReGoecodeSearch:self.reGeocodeSearchRequest];//逆地理编码查询 onReGeocodeSearchDone
}


//单路径
- (void)singleRoutePlanWithStartAnnotation:(MAPointAnnotation*)startAnnotation destinationAnnotation:(MAPointAnnotation*)destinationAnnotation
{
    //进行单路径规划
    NSLog(@"-------进行单路径规划----------");
    
    AMapNaviPoint *startPoint = [AMapNaviPoint locationWithLatitude:self.startAnnotation.coordinate.latitude
                                                          longitude:self.startAnnotation.coordinate.longitude];
    
    AMapNaviPoint *endPoint = [AMapNaviPoint locationWithLatitude:self.destinationAnnotation.coordinate.latitude
                                                        longitude:self.destinationAnnotation.coordinate.longitude];
    
    
    [self.driveManager calculateDriveRouteWithStartPoints:@[startPoint] endPoints:@[endPoint] wayPoints:nil drivingStrategy:9];
    
}


- (void)searchDriveRouteWithStartAnnotation:(MAPointAnnotation*)startAnnotation destinationAnnotation:(MAPointAnnotation*)destinationAnnotation
{
    self.startAnnotation= startAnnotation;
    self.destinationAnnotation = destinationAnnotation;
    
    if (self.drivingRouteSearchRequest == nil) {
        self.drivingRouteSearchRequest = [[AMapDrivingRouteSearchRequest alloc] init];
    }
    
    self.drivingRouteSearchRequest.requireExtension = YES;
    self.drivingRouteSearchRequest.strategy = 17;
    /* 出发点. */
    self.drivingRouteSearchRequest.origin = [AMapGeoPoint locationWithLatitude:self.startAnnotation.coordinate.latitude
                                                                     longitude:self.startAnnotation.coordinate.longitude];
    /* 目的地. */
    self.drivingRouteSearchRequest.destination = [AMapGeoPoint locationWithLatitude:self.destinationAnnotation.coordinate.latitude
                                                                          longitude:self.destinationAnnotation.coordinate.longitude];
    
    [self.search AMapDrivingRouteSearch:self.drivingRouteSearchRequest];//驾车路径规划查询 onRouteSearchDone
    
}






- (void)searchPOIKeywords:(NSString *)keywords
{
    
    if (keywords.length == 0) {
        return ;
    }
    
    if (self.poiKeywordsSearchRequest == nil)
    {
        self.poiKeywordsSearchRequest = [[AMapPOIKeywordsSearchRequest alloc] init];
    }
    
    self.poiKeywordsSearchRequest.keywords = keywords;
    //    request.keywords            = @"北京大学";
    //    request.city                = @"北京";
    //    request.types               = @"高等院校";
    //    request.requireExtension    = YES;//是否返回扩展信息
    //    /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
    //    request.cityLimit           = YES;//只搜索
    self.poiKeywordsSearchRequest.requireSubPOIs      = YES;
    
    [self.search AMapPOIKeywordsSearch:self.poiKeywordsSearchRequest];
    
}







// ----------------------------------------------------------------------------------------
// MARK: - 查询、请求 回调
// ----------------------------------------------------------------------------------------

#pragma mark ----------查询、请求 回调----------------
-(void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"-------request:%@------error:%@-------",request,error);
}

//逆地理编码回调
-(void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    NSLog(@"-----逆地理编码回调-----");
    if (response.regeocode == nil){
        return;
    }
}

//路线回调
- (void)onRouteSearchDone:(AMapRouteSearchBaseRequest *)request response:(AMapRouteSearchResponse *)response
{
    NSLog(@"-----路线规划回调-----");
    if (response.route == nil) {
        return ;
    }
}

- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    NSLog(@"-----POI回调-----");
    if (response.pois.count == 0){
        return ;
    }
}

- (void)driveManager:(AMapNaviDriveManager *)driveManager error:(NSError *)error
{
    NSLog(@"-------驾车算路失败-----------");
}

- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"-------驾车算路成功-----------");
    
    if (driveManager.naviRoutes.count <= 0 ) {
        return;
    }
}










// ----------------------------------------------------------------------------------------
// MARK: - 地图接口调用
// ----------------------------------------------------------------------------------------

#pragma mark -----------地图接口调用---------------
- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction
{
    NSLog(@"------地图移动结束------");
    
    //    CGPoint point = CGPointMake(kScreenW / 2, kScreenH / 2);
    //
    //    CLLocationCoordinate2D randomCoordinate =  [self.mapView convertPoint:point toCoordinateFromView:self.supView];
    //
    //    [self searchReGeocodeWithCoordinate:randomCoordinate];
    
    
}

- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"------地图区域改变------");
    [self.mapView removeFromSuperview];
    [self.supView addSubview:self.mapView];
    [self.supView insertSubview:self.mapView atIndex:0];
    
}











// ----------------------------------------------------------------------------------------
// MARK: - Util
// ----------------------------------------------------------------------------------------

- (CGFloat)mapDistanceBetweenCoordinate:(CLLocationCoordinate2D )coordinateA AndCoordinate:(CLLocationCoordinate2D)coordinateB
{
    MAMapPoint p1 = MAMapPointForCoordinate(coordinateA);
    MAMapPoint p2 = MAMapPointForCoordinate(coordinateB);
    CLLocationDistance distance =  MAMetersBetweenMapPoints(p1, p2);
    
    return distance;//两点距离
}

- (void)clearMapSubViews
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView removeOverlays:self.mapView.overlays];
}


























@end















