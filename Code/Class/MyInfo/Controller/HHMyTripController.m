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

@property (nonatomic, assign) CLLocationCoordinate2D startCoordinate;
@property (nonatomic, assign) CLLocationCoordinate2D destinationCoordinate;



@end

@implementation HHMyTripController

- (void)dealloc
{
    NSLog(@"---HHMyTripController 释放-----");
}

- (void)backClick
{
    [[MapManager manager] removeMapView];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[MapManager manager] locateMapViewInView:self.view frame:self.view.bounds];
    
    [MapManager manager].lineStatus = LineStatusEndJourney;
    
    NSInteger lineStatus = [MapManager manager].lineStatus;
    
    switch (lineStatus) {
        case LineStatusEndJourney:
            {
                [self startAndend];
            }
            break;
            
        default:
            break;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的行程";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"dd"
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(dddddd)];
    
    [self initData];
    
}

- (void)initData
{
    self.startCoordinate = CLLocationCoordinate2DMake(31.232205,121.365586);
    self.destinationCoordinate = CLLocationCoordinate2DMake(31.282205,121.315586);
}

- (void)startAndend
{
    MAPointAnnotation *startAnnotation = [[MAPointAnnotation alloc]init];
    startAnnotation.coordinate = self.startCoordinate;
    startAnnotation.title = @"开始";
    [[MapManager manager].mapView addAnnotation:startAnnotation];
    
    
    MAPointAnnotation *destinationAnnotation = [[MAPointAnnotation alloc]init];
    destinationAnnotation.coordinate = self.destinationCoordinate;
    destinationAnnotation.title = @"结束";
    [[MapManager manager].mapView addAnnotation:destinationAnnotation];
    
    
    
    [[MapManager manager].mapView showAnnotations:@[startAnnotation,destinationAnnotation] animated:YES];
    
}



- (void)dddddd
{
  
}









@end
