//
//  AFNetCheckState.h
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum{
    NetStatusNotReachable,
    NetStatusReachableViaWiFi,
    NetStatusReachableViaWWAN,
    NetStatusReachabilityUnknown
} NetWorkState;


@interface AFNetCheckState : NSObject

@property (nonatomic, assign) NetWorkState  StateType;

+(instancetype)NetCheckState;

- (void)CheckNetworkState;
@end
