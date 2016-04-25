//
//  UIView+UIViewUtils.h
//  HZProgress
//
//  Created by 王会洲 on 16/4/8.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface UIView (UIViewUtils)

/**
 *  显示错误信息带角标提示
 */
-(void)showHUDIndicatorViewSuccessAtCenter:(NSString *)success;

/**
 *  显示正确提示带角标提示
 */
-(void)showHUDIndicatorViewErrorAtCenter:(NSString *)error;

/**
 *  网络请求相关提示
 *
 *  @param indiTitle 提示标题
 */
- (void)showHUDIndicatorViewAtCenter:(NSString *)indiTitle;
/**
 *  隐藏弹层
 */
- (void)hideHUDIndicatorViewAtCenter;
/*
- (void)showHUDIndicatorViewAtCenter:(NSString *)indiTitle yOffset:(CGFloat)y;
- (MBProgressHUD *)createHUDIndicatorViewAtCenter:(NSString *)indiTitle icon:(NSString *)icon yOffset:(CGFloat)y;
- (MBProgressHUD *)getHUDIndicatorViewAtCenter;


- (UIView *)viewWithTagNotDeepCounting:(NSInteger)tag;
 */
@end
