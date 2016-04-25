//
//  AFNHttpHelper.h
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>

#if NS_BLOCKS_AVAILABLE
// 执行成功Block
typedef void(^successBlock)(id responseObject);
// 执行失败Block
typedef void(^failureBlock)(id error);
#endif

@interface AFNHttpHelper : NSObject

+ (AFNHttpHelper *)defaultManager;


-(void)GET:(NSString *)requstString
                            parameters:(NSDictionary *)parameters
                               success:(successBlock)success
                               failure:(failureBlock)failure;


-(void)POST:(NSString *)requstString
                             parameters:(NSDictionary *)parameters
                                success:(successBlock)success
                                failure:(failureBlock)failure;

-(void)requestHttpByUserWithString:(NSString *)requstString
                        parameters:(NSDictionary *)parameters
                           success:(successBlock)success
                           failure:(failureBlock)failure;


@end
