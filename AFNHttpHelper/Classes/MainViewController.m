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
//#import "NextViewController.h"
#import "AFHttpTool.h"
#import "AFNetCheckState.h"
#import "UIView+UIViewUtils.h"

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


-(void)AFNPOST {
    NSDictionary * dict = @{@"area_code":@"MQ==",@"sig":@"d0666a0915a86d0b2107aa7cb3d1bc2f"};
    NSString * url = @"http://global.eshuike.com/Itaxer/get_banner_list";
    

    
    
  [[AFHttpTool defaultManager]POST:url params:(dict) success:^(id responseObject) {
      NSLog(@"---%@",responseObject);
  } failure:^(NSError *error) {
      NSLog(@"---%@",error);
  }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"网络请求";
    [self AFNPOST];
    //[self AFNBasicGETRequest];
    
    return;
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 200, 100, 80);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"Tool(GET)" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(ToolGET:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(170, 200, 100, 80);
    btn1.backgroundColor = [UIColor orangeColor];
    [btn1 setTitle:@"Tool(POST)" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(ToolPost:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(50, 300, 120, 80);
    btn3.backgroundColor = [UIColor orangeColor];
    [btn3 setTitle:@"HELPER(GET)" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(HelperGET:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(200, 300, 130, 80);
    btn4.backgroundColor = [UIColor orangeColor];
    [btn4 setTitle:@"HELPER(POST)" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(HelperPOST:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    
    UIButton * btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(200, 400, 130, 80);
    btn5.backgroundColor = [UIColor orangeColor];
    [btn5 setTitle:@"HTTPS(GET)" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(HTTPSGET:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];


    
    
    //NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    
    
//    NSDictionary * parameters = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
//    [[AFHttpTool defaultManager] requestHttpByUserWithString:@"list" parameters:parameters success:^(id responseObject) {
//        NSLog(@"----->>>>%@",responseObject);
//    } failure:^(NSError *error) {
//        NSLog(@"---<<<<<<%@",error);
//    }];
    
    
//    NSDictionary * parameterslist = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
//    
//    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
//    [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"login" parameters:parameters success:^(id responseObject) {
//        NSLog(@"---->>>>%@",responseObject);
//    } failure:^(id error) {
//        NSLog(@"----<<<<<<<%@",error);
//    }];
//    
//    
//    [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"list" parameters:parameterslist success:^(id responseObject) {
//        NSLog(@"---->>>>%@",responseObject);
//    } failure:^(id error) {
//        NSLog(@"----<<<<<<<%@",error);
//    }];
    
    
    // 测试网络
   // AFNetCheckState * states = [AFNetCheckState NetCheckState];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, 320, 100)];
    [self.view addSubview:self.imageView];

}


-(void)HTTPSGET:(UIButton *)sender {
    [self.view showHUDIndicatorViewAtCenter:@"加载中"];
    NSDictionary * parameters = @{@"client_id":@"qyer_android"};
    [[AFHttpTool defaultManager] requestHttpByUserWithString:@"ssl" parameters:parameters success:^(id responseObject) {
        NSLog(@"----->>>>%@",responseObject);
        [self.view hideHUDIndicatorViewAtCenter];
    } failure:^(NSError *error) {
        NSLog(@"---<<<<<<%@",error);
        [self.view hideHUDIndicatorViewAtCenter];
    }];
}


-(void)ToolGET:(UIButton *)sender {
    [self.view showHUDIndicatorViewAtCenter:@"加载中"];
    NSDictionary * parameters = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
  [[AFHttpTool defaultManager] requestHttpByUserWithString:@"list" parameters:parameters success:^(id responseObject) {
        NSLog(@"----->>>>%@",responseObject);
        [self.view hideHUDIndicatorViewAtCenter];
    } failure:^(NSError *error) {
        NSLog(@"---<<<<<<%@",error);
        [self.view hideHUDIndicatorViewAtCenter];
    }];
}

/**
 *  tool---POST
 *
 *  @param sender <#sender description#>
 */
-(void)ToolPost:(UIButton *)sender {
    [self.view showHUDIndicatorViewAtCenter:@"加载中"];
    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    [[AFHttpTool defaultManager] requestHttpByUserWithString:@"login" parameters:parameters success:^(id responseObject) {
        NSLog(@"----->>>>%@",responseObject);
        [self.view hideHUDIndicatorViewAtCenter];
    } failure:^(NSError *error) {
        NSLog(@"---<<<<<<%@",error);
        [self.view hideHUDIndicatorViewAtCenter];
    }];
}

-(void)HelperGET:(UIButton *)sender {
    
   
    [self.view showHUDIndicatorViewAtCenter:@"HelperGET加载"];
    
    NSDictionary * parameterslist = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
        [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"list" parameters:parameterslist success:^(id responseObject) {
            NSLog(@"---->>>>%@",responseObject);
//            [self.view hideHUDIndicatorViewAtCenter];
            //[self.view showHUDIndicatorViewSuccessAtCenter:@"ddddddxxxxxxxxxxxx"];
        } failure:^(id error) {
            NSLog(@"----<<<<<<<%@",error);
         [self.view showHUDViewErrorAtCenter:@"加载失败"];
        }];
}

-(void)HelperPOST:(UIButton *)sender {
    
    
    [self.view showHUDIndicatorViewAtCenter:@"HelperPOST加载"];
    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
        [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"login" parameters:parameters success:^(id responseObject) {
            NSLog(@"---->>>>%@",responseObject);
            [self.view hideHUDIndicatorViewAtCenter];
            [self.view  showHUDViewSuccessAtCenter:@"ddddddddddddddd"];
        } failure:^(id error) {
            NSLog(@"----<<<<<<<%@",error);
            [self.view showHUDViewErrorAtCenter:@"加载失败"];
        }];
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
//    NextViewController * next = [[NextViewController alloc] init];
//    //next.cancelBlock = ^(NSString * str ) {
////        NSLog(@"------");
////    };
//    [self.navigationController pushViewController:next animated:YES];
    
   
}



-(void)test {
    
    //    NSDictionary * param = @{@"userID":@"上平32",@"verCode":@"123"};
    //    NSString * entUrl = [NSString stringWithFormat:@"/%@/%@",@"ddd",@"tttttt"];
    //    NSString * str =  [NSString queryStringFromDictionary:param addingPercentEscapes:NO];
    //    NSLog(@"====<<<<<%@",str);
    
}

/**
 *  基于AFN的网络POST请求
 */
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


/**
 *  基本的POST请求
 */
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
    
    NSDictionary *parameters = @{@"phone":@"18790723015",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    NSError*  error;
    //5.设置请求体
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
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
    
    NSString *url = @"http://open.qyer.com/qyer/bbs/forum_thread_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&forum_id=1&type=1&count=10&page=1&delcache=0";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
    // 基本网络请求
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            
            if (httpResponse.statusCode == 200) {
                
                NSString *string = [[NSString alloc] initWithData:data encoding:NSStringEncodingConversionAllowLossy];
                NSLog(@"%@",string);
            }
        }
    }];
    
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

/**
 *  基于AFN的网络下载
 */
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



- (AFSecurityPolicy*)customSecurityPolicy
{
    // 先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"Robert Laurence.cer" ofType:nil];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO  如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = @[certData];
    return securityPolicy;
}

- (AFSecurityPolicy * )SSLPinningModeCertificate {
        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"srca.cer" ofType:nil];//证书的路径
        NSData *certData = [NSData dataWithContentsOfFile:cerPath];
        // AFSSLPinningModeCertificate 使用证书验证模式
        AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
        securityPolicy.pinnedCertificates = [NSSet setWithObject:certData];
        securityPolicy.allowInvalidCertificates = YES;
        [securityPolicy setValidatesDomainName:NO];
        //self.AFSManager.securityPolicy = securityPolicy;
    
    return securityPolicy;
}



-(void)AFNBasicGETRequest {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // 设置网络超时
    configuration.timeoutIntervalForRequest = 5;
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //NSString *url = @"http://open.qyer.com/qyer/bbs/forum_thread_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&forum_id=1&type=1&count=10&page=1&delcache=0";

    
    manager.securityPolicy = [self SSLPinningModeCertificate];
    
    NSString * url = @"https://www.12306.cn/mormhweb/";
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        if (error) {
            NSLog(@"Error---->>>: %@", error);
        } else {
            NSLog(@"%@ ---<[[[[[%@", response, responseObject);
        }
    }];
    
    [dataTask resume];
}




/**
 *  基于AFN的网络GET请求
 */
-(void)AFNBasicRequesthttpBody {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
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
