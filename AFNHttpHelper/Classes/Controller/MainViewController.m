//
//  MainViewController.m
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/19.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetworking.h"


@interface MainViewController ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view appear];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"网络请求";
    
    
//    [self basicURLRequest];
    //[self BaseDownloadImage];
    [self AFNDownloadImage];
    
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, 320, 100)];
    self.imageView.backgroundColor  = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
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




-(void)AFNBasicRequest {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
