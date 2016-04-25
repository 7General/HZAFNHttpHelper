//
//  NextViewController.m
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

-(void)setCancelBlock:(HZBasicActionBlock)cancelBlock {
    _cancelBlock = cancelBlock;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(BackCliclAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)BackCliclAction {
    if (self.cancelBlock) {
        self.cancelBlock(@"dd");
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
