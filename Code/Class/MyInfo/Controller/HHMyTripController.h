//
//  HHMyTripController.h
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHBaseController.h"

@interface HHMyTripController : HHBaseController

@property (nonatomic,copy) void(^callback)(NSInteger lineStatus);


@end
