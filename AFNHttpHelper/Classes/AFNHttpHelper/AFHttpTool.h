//
//  AFHttpTool.h
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZAFNConfig.h"
#import "AFNetworking.h"





typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailureBlock)(NSError *error);


@interface AFHttpTool : NSObject

+ (AFHttpTool *)defaultManager;

/**
 *  发起GET请求
 *
 *  @param api          地址
 *  @param params       参数
 *  @param successBlock 成功
 *  @param failureBlock 失败
 *
 *  @return NSURLSessionDataTask
 */
- (NSURLSessionDataTask *)GET:(NSString *)api params:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

/*!
 *  发起GET请求
 *
 *  @param api          地址
 *  @param params       参数
 *  @param successBlock 成功
 *  @param failureBlock 失败
 *
 *  @return NSURLSessionDataTask
 */
- (NSURLSessionDataTask *)POST:(NSString *)api params:(NSDictionary *)params success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

-(void)requestHttpByUserWithString:(NSString *)requstString
                                           parameters:(NSDictionary *)parameters
                                                success:(SuccessBlock)success
                                                    failure:(FailureBlock)failure;



/**
 *  取消当前网络请求
 */
- (void)cancelCurrentOperation;

/**
 *  取消当前网络所有请求
 */
- (void)cancelAllOperations;

@end
