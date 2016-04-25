//
//  AFNHttpHelper.m
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#define TIMEOUT  10


#import "AFNHttpHelper.h"
#import "AFNetworking.h"
#import "ConfigManager.h"
#import "Additions.h"

@implementation AFNHttpHelper

+ (instancetype)defaultManager {
    static AFNHttpHelper * defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [AFNHttpHelper new];
    });
    return defaultManager;
}



-(void)HttpRequestGetRequestWithString:(NSString *)requstString
                                                     parameters:(NSDictionary *)parameters
                                                          success:(successBlock)success
                                                              failure:(failureBlock)failure

{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // 设置网络超时
    configuration.timeoutIntervalForRequest = TIMEOUT;
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSDictionary *requestDic =[ConfigManager requestDicWithString:requstString];
    NSString * url = [requestDic objectForKey:@"url"];
//    NSString *method =[requestDic objectForKey:@"method"];
    
    NSString * urlFellowString = [@"?" stringByAppendingString:[NSString queryStringFromDictionary:parameters addingPercentEscapes:YES]];
    
    NSURL *URL = [NSURL URLWithString:[url stringByAppendingString:urlFellowString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 412) {
                NSLog(@"前提条件失败");
            }
            if (failure) {
                failure(error);
            }
        } else {
            if (success) {
                success(responseObject);
            }
        }
    }];
    [dataTask resume];
}

-(void)HttpRequestPostRequestWithString:(NSString *)requstString
                            parameters:(NSDictionary *)parameters
                               success:(successBlock)success
                                failure:(failureBlock)failure {
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = TIMEOUT;
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSDictionary *requestDic =[ConfigManager requestDicWithString:requstString];
    NSString * url = [requestDic objectForKey:@"url"];
    //    NSString *method =[requestDic objectForKey:@"method"];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:URL];
    /*!
     *  设置发送数据格式为json
     */
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPMethod:@"POST"];
    NSError*  error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
    
    NSURLSessionDataTask * task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 412) {
                NSLog(@"前提条件失败");
            }
            if (failure) {
                failure(error);
            }
        } else {
            if (success) {
                success(responseObject);
            }
        }
    }];
    [task resume];
}



-(void)CreatingaDownloadTask {
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager * manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    NSURL * url = [NSURL URLWithString:@"http://image.tianjimedia.com/uploadImages/2011/252/8GO666XNQM49.jpg"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask * task = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSURL *downloadURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [downloadURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (!error) {
            //此处已经在主线程了
            //UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:filePath]];
            //self.imageView.image = image;
        }
    }];
    
    [task resume];

}

@end
