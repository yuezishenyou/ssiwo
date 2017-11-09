//
//  HHAMapHelper.h
//  ssiswo
//
//  Created by maoziyue on 2017/9/7.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHBaseController.h"
//基础定位类
#import <AMapFoundationKit/AMapFoundationKit.h>
//高德地图基础类
#import <MAMapKit/MAMapKit.h>
//搜索基础类
#import <AMapSearchKit/AMapSearchKit.h>
//高德导航类
#import <AMapNaviKit/AMapNaviKit.h>




@interface HHAMapHelper : HHBaseController

@property (nonatomic,strong) MAMapView *mapView;

@property (nonatomic,strong) AMapSearchAPI *search;

@property (nonatomic,strong) AMapNaviDriveManager *driveManager;

@property (nonatomic,strong)AMapReGeocodeSearchRequest *reGeocodeSearchRequest;//逆地理请求

@property (nonatomic,strong)AMapDrivingRouteSearchRequest *drivingRouteSearchRequest;//驾车路径规划查询

@property (nonatomic,strong)AMapPOIKeywordsSearchRequest *poiKeywordsSearchRequest;//关键词搜索

@property (nonatomic,strong) CLLocation *currentLocation;

@property (nonatomic,weak  ) UIView *supView;


/* 起始点经纬度. */
@property (nonatomic) CLLocationCoordinate2D startCoordinate;
/* 终点经纬度. */
@property (nonatomic) CLLocationCoordinate2D destinationCoordinate;

@property (nonatomic, strong) MAPointAnnotation *startAnnotation;

@property (nonatomic, strong) MAPointAnnotation *destinationAnnotation;





- (void)locateMapViewInView:(UIView *)mapSuerView
                      frame:(CGRect)frame;


- (void)viewDidDeallocOrReceiveMemoryWarning;





// ----------------------------------------------------------------------------------------
// MARK: - 大头针生成和绘制
// ----------------------------------------------------------------------------------------

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation;

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay;













// ----------------------------------------------------------------------------------------
// MARK: - 用户定位
// ----------------------------------------------------------------------------------------

- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error;


-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation;











// ----------------------------------------------------------------------------------------
// MARK: - 查询、请求
// ----------------------------------------------------------------------------------------

- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate;


- (void)searchDriveRouteWithStartAnnotation:(MAPointAnnotation*)startAnnotation destinationAnnotation:(MAPointAnnotation*)destinationAnnotation;

- (void)singleRoutePlanWithStartAnnotation:(MAPointAnnotation*)startAnnotation destinationAnnotation:(MAPointAnnotation*)destinationAnnotation;

- (void)searchPOIKeywords:(NSString *)keywords;







// ----------------------------------------------------------------------------------------
// MARK: - 查询、请求 回调
// ----------------------------------------------------------------------------------------

-(void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error;

-(void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response;

- (void)onRouteSearchDone:(AMapRouteSearchBaseRequest *)request response:(AMapRouteSearchResponse *)response;

- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response;

- (void)driveManager:(AMapNaviDriveManager *)driveManager error:(NSError *)error;

- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager;






// ----------------------------------------------------------------------------------------
// MARK: - 地图接口调用
// ----------------------------------------------------------------------------------------

- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction;

- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated;


















// ----------------------------------------------------------------------------------------
// MARK: - Util
// ----------------------------------------------------------------------------------------

- (CGFloat)mapDistanceBetweenCoordinate:(CLLocationCoordinate2D )coordinateA AndCoordinate:(CLLocationCoordinate2D)coordinateB;

- (void)clearMapSubViews;















@end

























