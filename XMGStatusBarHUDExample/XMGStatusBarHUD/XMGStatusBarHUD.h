//
//  XMGStatusBarHUD.h
//  XMGStatusBarHUD
//
//  Created by hedong on 16/8/30.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGStatusBarHUD : NSObject

/**
 *  显示普通信息
 *
 *  @param msg      文字
 *  @param image    图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
