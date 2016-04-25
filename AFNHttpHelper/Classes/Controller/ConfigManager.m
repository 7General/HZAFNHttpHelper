//
//  ConfigManager.m
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#define APIHOSTGET @"http://open.qyer.com/qyer/bbs/forum_thread_list"
#define APIHOSTPOST @"http://icloud.chinacloudapp.cn/icloud"

#import "ConfigManager.h"

@implementation ConfigManager
+(NSDictionary *)requestDicWithString:(NSString *)string{
    NSString *url = APIHOSTGET;
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    
    if ([string isEqualToString:@"GET"]) {
        NSString *url = APIHOSTGET;
        url =[url stringByAppendingString:@""];
        NSString *method =@"GET";
        NSArray *params =[NSArray arrayWithObjects:@"username",@"password", nil];
        NSMutableDictionary *tem =[[NSMutableDictionary alloc]initWithObjects:@[url,method,params] forKeys:@[@"url",@"method",@"params"]];
        dic =tem;
    }
    
    if ([string isEqualToString:@"POST"]) {
        NSString *url = APIHOSTPOST;
        url =[url stringByAppendingString:@"/app/v1/user/userlogin.do"];
        NSString *method =@"POST";
        NSArray *params =[NSArray arrayWithObjects:@"username",@"password", nil];
        NSMutableDictionary *tem =[[NSMutableDictionary alloc]initWithObjects:@[url,method,params] forKeys:@[@"url",@"method",@"params"]];
        dic =tem;
    }
    
    return dic;
}
@end
