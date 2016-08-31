//
//  XMGStatusBarHUD.m
//  XMGStatusBarHUD
//
//  Created by hedong on 16/8/30.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMGStatusBarHUD.h"

#define XMGMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const XMGMessageDuration = 2.0;
/** 消息的显示、隐藏动画时间 */
static CGFloat const XMGAnimationDuration = 0.25;
/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

@implementation XMGStatusBarHUD

/** 初始化窗口 */
+ (void)showWindow {
    
    //frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    //显示窗口
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    //动画效果
    frame.origin.y = 0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息
 *
 *  @param msg      文字
 *  @param image    图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image {
    
    //销毁timer
    [timer_ invalidate];
    
    //显示窗口
    [self showWindow];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = XMGMessageFont;
    [window_ addSubview:button];
    
    //定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg {
    [self showMessage:msg image:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg {
    [self showMessage:msg image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/check"]];
}

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg {
    [self showMessage:msg image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/error"]];
}

/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)msg {
    
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //显示文字
    UILabel *label = [[UILabel alloc] init];
    label.frame = window_.bounds;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.font = XMGMessageFont;
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    //显示指示器
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //文字宽度
    CGFloat msgWidth = [msg sizeWithAttributes:@{NSFontAttributeName:XMGMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgWidth) * 0.5 - 15;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}

/**
 *  隐藏
 */
+ (void)hide {
    
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        
        window_.frame  = frame;
    } completion:^(BOOL finished) {
        [window_ removeFromSuperview];
        window_.hidden = YES;
    }];
}

@end
