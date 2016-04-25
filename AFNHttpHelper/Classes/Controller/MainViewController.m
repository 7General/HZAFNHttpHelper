//
//  MainViewController.m
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/19.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetworking.h"
#import "Additions.h"
#import "AFNHttpHelper.h"
#import "NextViewController.h"
#import "AFHttpTool.h"

typedef void(^testBlock)(NSString * names);


@interface MainViewController ()

@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, copy) testBlock  testB;

@end

@implementation MainViewController

-(void)setTestB:(testBlock)testB {
    _testB = testB;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.view appear];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"网络请求";
    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 200, 100, 100);
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(testCliclAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];


    
    
    //NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    
    
//    NSDictionary * parameters = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
//    [[AFHttpTool defaultManager] requestHttpByUserWithString:@"GET" parameters:parameters success:^(id responseObject) {
//        NSLog(@"----->>>>%@",responseObject);
//    } failure:^(NSError *error) {
//        NSLog(@"---<<<<<<%@",error);
//    }];
    
    
    NSDictionary * parameterslist = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
    
    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"login" parameters:parameters success:^(id responseObject) {
        NSLog(@"---->>>>%@",responseObject);
    } failure:^(id error) {
        NSLog(@"----<<<<<<<%@",error);
    }];
    
    
    [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"list" parameters:parameterslist success:^(id responseObject) {
        NSLog(@"---->>>>%@",responseObject);
    } failure:^(id error) {
        NSLog(@"----<<<<<<<%@",error);
    }];
    
    
    
    
    
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, 320, 100)];
    [self.view addSubview:self.imageView];
    
    
    
   
}

-(void)test2 {
    
    //    [self basicURLRequest];
    [self AFNBasicGETRequest];
    //[self AFNBasicRequesthttpBody];
    
    //[self BaseDownloadImage];
    //[self AFNDownloadImage];
    
    //    [self BasicPostRequst];
    
    // AFNGET网络请求
    //    NSDictionary * dict = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
    //    [[AFNHttpHelper defaultManager] HttpRequestGetRequestWithString:@"GET" parameters:dict success:^(id responseObject) {
    //        NSLog(@"----%@",responseObject);
    //    } failure:^(id error) {
    //
    //    }];
    
    
    
    
    //[self AFNHttpPostRequest];
    
    //    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    //    [[AFNHttpHelper defaultManager] HttpRequestPostRequestWithString:@"POST" parameters:parameters success:^(id responseObject) {
    //        NSLog(@"---yes-->>>%@",responseObject);
    //    } failure:^(id error) {
    //        NSLog(@"---no--<<<<<<<%@",error);
    //    }];


}



-(void)testCliclAction {
    NextViewController * next = [[NextViewController alloc] init];
    //next.cancelBlock = ^(NSString * str ) {
//        NSLog(@"------");
//    };
    [self.navigationController pushViewController:next animated:YES];
    
   
}



-(void)test {
    
    //    NSDictionary * param = @{@"userID":@"上平32",@"verCode":@"123"};
    //    NSString * entUrl = [NSString stringWithFormat:@"/%@/%@",@"ddd",@"tttttt"];
    //    NSString * str =  [NSString queryStringFromDictionary:param addingPercentEscapes:NO];
    //    NSLog(@"====<<<<<%@",str);
    
}

-(void)AFNHttpPostRequest {
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:@"http://icloud.chinacloudapp.cn/icloud/app/v1/user/userlogin.do"];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPMethod:@"POST"];
    
    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    NSError*  error;
    //5.设置请求体
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
    
    NSURLSessionDataTask * task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"---%@",responseObject);
        }
    }];
    [task resume];
}


-(void)BasicPostRequst {
    //1.创建会话对象
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
    //2.根据会话对象创建task
    NSURL *url = [NSURL URLWithString:@"http://icloud.chinacloudapp.cn/icloud/app/v1/user/userlogin.do"];
    
    //3.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //4.修改请求方法为POST
    request.HTTPMethod = @"POST";
    
    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    NSError*  error;
    //5.设置请求体
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
    //6.根据会话对象创建一个Task(发送请求）
    /*
     26      第一个参数：请求对象
     27      第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
     28                 data：响应体信息（期望的数据）
     29                 response：响应头信息，主要是对服务器端的描述
     30                 error：错误信息，如果请求失败，则error有值
     31      */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //8.解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@",dict);
        
    }];
    
    //7.执行任务
    [dataTask resume];
    
    
    
}





/**
 *  基本的网络请求
 */
-(void)basicURLRequest {
    //1
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.okcoin.com/api/ticker.do"]];
    //2
    //NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
    //3 基本网络请求
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            //4
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            //5
            if (httpResponse.statusCode == 200) {
                //6
                NSString *string = [[NSString alloc] initWithData:data encoding:NSStringEncodingConversionAllowLossy];
                NSLog(@"%@",string);
            }
        }
    }];
    //7
    [dataTask resume];
}

/**
 *  基本下载图片方法
 */
-(void)BaseDownloadImage {
    NSURL * url = [NSURL URLWithString:@"http://image.tianjimedia.com/uploadImages/2011/252/8GO666XNQM49.jpg"];
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    // 当statusCode等于200时，表示网络没问题
    NSURLSessionDownloadTask * task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            UIImage *imageData = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image =  imageData;
            });
        }
    }];
    [task resume];
}

-(void)AFNDownloadImage {
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
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:filePath]];
            self.imageView.image = image;
        }
    }];
    
    [task resume];
}




-(void)AFNBasicGETRequest {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // 设置网络超时
    configuration.timeoutIntervalForRequest = 5;
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *url = @"http://open.qyer.com/qyer/bbs/forum_thread_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&forum_id=1&type=1&count=10&page=1&delcache=0";
    
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    
    [dataTask resume];
    
    
}




-(void)AFNBasicRequesthttpBody {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    configuration.timeoutIntervalForRequest = 15;
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    

    NSString *url = @"http://open.qyer.com/qyer/bbs/forum_thread_list";

    NSDictionary * dict = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
    
    NSString *URLFellowString = [@"?" stringByAppendingString:[NSString queryStringFromDictionary:dict addingPercentEscapes:YES]];
    
    NSURL *URL = [NSURL URLWithString:[url stringByAppendingString:URLFellowString]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];

    
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"-------Error: %@", error);
        } else {
            NSLog(@">>>>>%@", responseObject);
        }
    }];
    
    [dataTask resume];
    
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
