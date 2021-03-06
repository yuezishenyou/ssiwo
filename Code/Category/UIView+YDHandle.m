//
//  UIView+YDHandle.m
//  YDDriver
//
//  Created by maoziyue on 17/4/6.
//  Copyright © 2017年 Shanghai Meiyue InfoTech Ltd. All rights reserved.
//

#import "UIView+YDHandle.h"

@implementation UIView (YDHandle)


-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setX:(CGFloat)x
{
    CGRect frame =  self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)x
{
    return self.frame.origin.x;
}


- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}




@end
