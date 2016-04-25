//
//  AFNetCheckState.m
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "AFNetCheckState.h"
#import "AFNetworking.h"


@implementation AFNetCheckState

+(instancetype)NetCheckState {
    return [[AFNetCheckState alloc] init];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self CheckNetworkState];
    }
    return self;
}
/**
 *  监测网络请求是否可用
 */
- (void)CheckNetworkState
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    __block NetWorkState isExistenceNetwork = -1;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                isExistenceNetwork = WorkStatusReachableViaWiFi;
                NSLog(@"WIFI");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                isExistenceNetwork = WorkStatusReachableViaWWAN;
                NSLog(@"自带网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                isExistenceNetwork = WorkStatusNotReachable;
                NSLog(@"没有网络");
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                isExistenceNetwork = WorkStatusReachabilityUnknown;
                NSLog(@"未知网络");
                break;
            default:
                break;
        }
        
    }];
    
    //开始监听
    [manager.reachabilityManager startMonitoring];
    
    //返回网络枚举值
//    return isExistenceNetwork;
}

@end
