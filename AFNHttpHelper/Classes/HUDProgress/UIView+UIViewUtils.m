//
//  UIView+UIViewUtils.m
//  HZProgress
//
//  Created by 王会洲 on 16/4/8.
//  Copyright © 2016年 王会洲. All rights reserved.
//
#define hudViewTag                     0x98751235
#define hudActionTag                   0x98751367
#import "UIView+UIViewUtils.h"

@implementation UIView (UIViewUtils)


#pragma mark -
#pragma mark hud
/**
 *  显示错误信息带角标提示
 */

-(void)showHUDViewErrorAtCenter:(NSString *)error {
    [self showHUDIndicatorViewAtCenter:error icon:@"error.png"];
    [self hide:YES afterDelay:0.7];
}

/**
 *  显示正确提示带角标提示
 */
-(void)showHUDViewSuccessAtCenter:(NSString *)success {
    [self showHUDIndicatorViewAtCenter:success icon:@"success.png"];
    [self hide:YES afterDelay:0.7];
  
}
/**
 *  延迟加载
 */
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(hideDelayed:) withObject:[NSNumber numberWithBool:animated] afterDelay:delay];
}
- (void)hideDelayed:(NSNumber *)animated {
    //[self hideHUDIndicatorViewAtCenter];
    MBProgressHUD *hud = [self getHUDIndicatorViewAtCenter:hudActionTag];
    
    [hud hide:YES];
}


/**
 *  显示标题信息带图片
 *
 *  @param indiTitle 标题
 *  @param iconStr   提示图片
 */
- (void)showHUDIndicatorViewAtCenter:(NSString *)indiTitle icon:(NSString *)iconStr
{
    MBProgressHUD *hud = [self getHUDIndicatorViewAtCenter:hudActionTag];
    if (hud == nil){
        hud = [self createHUDIndicatorViewAtCenter:indiTitle icon:iconStr yOffset:0 withTag:hudActionTag];
        [hud show:YES];
    }else{
        hud.labelText = indiTitle;
    }
}





// **********************************************************************************
/**
 *  网络请求相关提示
 *
 *  @param indiTitle 提示标题
 */
- (void)showHUDIndicatorViewAtCenter:(NSString *)indiTitle
{
    MBProgressHUD *hud = [self getHUDIndicatorViewAtCenter:hudViewTag];
    if (hud == nil){
        hud = [self createHUDIndicatorViewAtCenter:indiTitle icon:nil yOffset:0 withTag:hudViewTag];
        [hud show:YES];
    }else{
        hud.labelText = indiTitle;
    }
}

- (void)showHUDIndicatorViewAtCenter:(NSString *)indiTitle yOffset:(CGFloat)y
{
    MBProgressHUD *hud = [self getHUDIndicatorViewAtCenter:hudViewTag];
    if (hud == nil){
        hud = [self createHUDIndicatorViewAtCenter:indiTitle icon:nil yOffset:y withTag:hudViewTag];
        [hud show:YES];
    }else{
        hud.labelText = indiTitle;
    }
}

/**
 *  隐藏弹层
 */
- (void)hideHUDIndicatorViewAtCenter
{
    MBProgressHUD *hud = [self getHUDIndicatorViewAtCenter:hudViewTag];
    [hud hide:YES];
}


- (MBProgressHUD *)createHUDIndicatorViewAtCenter:(NSString *)indiTitle icon:(NSString *)icon yOffset:(CGFloat)y withTag:(NSInteger )tags
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.layer.zPosition = 10;
    hud.yOffset = y;
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = indiTitle;
    
    if (icon) {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    }else {
        //hud.mode = MBProgressHUDModeText;
    }
    
    [self addSubview:hud];
    hud.tag = tags;
    return hud;
}

- (MBProgressHUD *)getHUDIndicatorViewAtCenter:(NSInteger)tags
{
    UIView *view = [self viewWithTagNotDeepCounting:tags];
    if (view != nil && [view isKindOfClass:[MBProgressHUD class]]){
        return (MBProgressHUD *)view;
    }
    else
    {
        return nil;
    }
}

- (UIView *)viewWithTagNotDeepCounting:(NSInteger)tag
{
    for (UIView *view in self.subviews)
    {
        if (view.tag == tag) {
            return view;
            break;
        }
    }
    return nil;
}
@end
