//
//  Global.h
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>


//初始化,制定行程，发单呼叫，取消呼叫，派单成功，订单取消，行程开始，行程中，结束行程，确认费用，订单评价
typedef NS_ENUM(NSInteger, LineStatus) {
    LineStatusNomal = 0,
    LineStatusPlan,
    LineStatusCall,
    LineStatusCancelCall,
    LineStatusOrderMarked,
    LineStatusOrderCancel,
    LineStatusStartJourney,
    LineStatusInJourney,
    LineStatusEndJourney,
    LineStatusPayBill,
    LineStatusEvaluate,         //11
};


@interface Global : NSObject

+ (instancetype)shareManager;

@property (nonatomic, assign) LineStatus lineStatus;


@end
