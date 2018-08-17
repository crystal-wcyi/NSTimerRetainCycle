//
//  EOCClass.m
//  NSTimerRetainCycleDemo
//
//  Created by apple on 2018/8/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "EOCClass.h"
#import "NSTimer+EOCBlocksSupport.h"

@implementation EOCClass {
    NSTimer *_pollTimer;
}

- (id)init {
    return [super init];
}

- (void)dealloc {
    [_pollTimer invalidate];
}

- (void)stopPolling {
    [_pollTimer invalidate];
    _pollTimer = nil;
}

- (void)startPolling {
//    _pollTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(p_doPoll) userInfo:nil repeats:YES];
    __weak typeof(self) weakSelf = self;
    _pollTimer = [NSTimer eoc_scheduledTimerWithTimeInterval:5.0 block:^{
//        [self p_doPoll];
        [weakSelf p_doPoll];
    } repeats:YES];
}

- (void)p_doPoll {
    //Poll the resource
}

@end
