//
//  Global.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "Global.h"

@implementation Global

+ (instancetype)shareManager
{
    static Global *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[Global alloc]init];
        }
    });
    return _instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    
}




















@end
