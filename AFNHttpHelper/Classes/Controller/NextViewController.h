//
//  NextViewController.h
//  AFNHttpHelper
//
//  Created by 王会洲 on 16/4/25.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HZBasicActionBlock)(NSString *);

@interface NextViewController : UIViewController
@property (nonatomic, copy) HZBasicActionBlock  cancelBlock;
@end
