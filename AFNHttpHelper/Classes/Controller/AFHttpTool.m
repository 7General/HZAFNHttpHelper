//
//  AFHttpTool.m
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

//最大请求超时时间


#import "AFHttpTool.h"
#import "ConfigManager.h"

@interface AFHttpTool ()
/**
 *  全部任务存放的数组
 */
@property (nonatomic, strong) NSMutableArray * allTasks;
@end


@implementation AFHttpTool

+ (instancetype)defaultManager {
    static AFHttpTool * defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [AFHttpTool new];
    });
    return defaultManager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"启动AFHttpTool");
    }
    return self;
}

/**
 *  初始化一个堆栈区
 */
-(NSMutableArray *)allTasks {
    if (_allTasks == nil) {
        _allTasks = [NSMutableArray new];
    }
    return _allTasks;
}


/**
 * 返回当前网络请求task
 */
- (NSURLSessionDataTask *)currentDataTask
{
    return (NSURLSessionDataTask *)[[self baseHttpRequest].tasks lastObject];
}

/**
 *  创建一个初始化的请求类
 */
- (AFHTTPSessionManager *)baseHttpRequest
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    manager.requestSerializer.timeoutInterval = TIMEOUT;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html",@"text/plain", @"text/javascript", nil];
    
    
    // 默认请求二进制
    // 默认响应是JSON
    
    // 告诉AFN，支持接受 text/xml 的数据
    // [AFJSONResponseSerializer serializer].acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    
    // 告诉AFN如何解析数据
    // 告诉AFN客户端, 将返回的数据当做JSON来处理，默认的是以JSON处理
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 告诉AFN客户端, 将返回的数据当做XML来处理
    //    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    // 告诉AFN客户端, 将返回的数据当做而进行来数据 (服务器返回什么就是什么)
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return manager;
}


/**
 *  监测网络请求是否可用
 */
- (BOOL)isConnectionAvailable
{
//    AFHTTPSessionManager *manager = [self baseHttpRequest];
//    __block NetStatus isExistenceNetwork = -1;
//    
//    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        
//        switch (status) {
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                isExistenceNetwork = NetStatusReachableViaWiFi;
//                NSLog(@"WIFI");
//                break;
//                
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                isExistenceNetwork = NetStatusReachableViaWWAN;
//                NSLog(@"自带网络");
//                break;
//                
//            case AFNetworkReachabilityStatusNotReachable:
//                isExistenceNetwork = NetStatusNotReachable;
//                NSLog(@"没有网络");
//                //没有网络弹窗提示
//                if (!isExistenceNetwork) {
//                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"当前网络不可用,请检查网络连接!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//                    [alertView show];
//                }
//                break;
//                
//            case AFNetworkReachabilityStatusUnknown:
//                isExistenceNetwork = NetStatusReachabilityUnknown;
//                NSLog(@"未知网络");
//                break;
//            default:
//                break;
//        }
//        
//    }];
//    
//    //开始监听
//    [manager.reachabilityManager startMonitoring];
//    
//    //返回网络枚举值
//    return isExistenceNetwork;
    
    return YES;
}



- (NSURLSessionDataTask *)GET:(NSString *)api params:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [self baseHttpRequest];
    NSURLSessionDataTask * currentDataTask = [manager GET:api parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    
    //当前网络请求任务添加到数组
    [self.allTasks addObject:currentDataTask];
    
    //返回该网络请求任务
    return currentDataTask;
}

- (NSURLSessionDataTask *)POST:(NSString *)api params:(NSDictionary *)params success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [self baseHttpRequest];
    NSURLSessionDataTask * currentDataTask = [manager POST:api parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    
    //当前网络请求任务添加到数组
    [self.allTasks addObject:currentDataTask];

    //返回该网络请求任务
    return currentDataTask;
}

-(void)requestHttpByUserWithString:(NSString *)requstString
                        parameters:(NSDictionary *)parameters
                           success:(SuccessBlock)success
                           failure:(FailureBlock)failure {
    NSDictionary *requestDic =[ConfigManager requestDicWithString:requstString];
    NSString * url = [requestDic objectForKey:@"url"];
    NSString *method =[requestDic objectForKey:@"method"];
    if ([method isEqualToString:@"POST"]) {
        NSLog(@"POST");
        [self POST:url params:parameters success:success failure:failure];
    }
    if ([method isEqualToString:@"GET"]) {
        NSLog(@"GET");
        [self GET:url params:parameters successBlock:success failureBlock:failure];
    }

}




/**
 *  取消所有请求
 */
- (void)cancelAllOperations
{
    [self.allTasks makeObjectsPerformSelector:@selector(cancel)];
    [self.allTasks removeAllObjects];
    
}

/**
 *  取消当前网络请求
 */
- (void)cancelCurrentOperation
{
    [[self.allTasks lastObject] cancel];
    [self.allTasks removeLastObject];
}


@end
