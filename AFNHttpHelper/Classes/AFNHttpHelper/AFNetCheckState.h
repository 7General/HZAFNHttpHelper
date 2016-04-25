//
//  AFNetCheckState.h
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum{
    WorkStatusNotReachable,               // 没有网络
    WorkStatusReachableViaWiFi,        // WIFI状态
    WorkStatusReachableViaWWAN,   // 手机自带网络
    WorkStatusReachabilityUnknown,   // 没有网络
} NetWorkState;


@interface AFNetCheckState : NSObject

@property (nonatomic, assign) NetWorkState  StateType;

+(instancetype)NetCheckState;

- (void)CheckNetworkState;
@end
