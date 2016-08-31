//
//  ViewController.m
//  XMGStatusBarHUDExample
//
//  Created by hedong on 16/8/31.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import "ViewController.h"
#import "XMGStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)message:(id)sender {
    [XMGStatusBarHUD showMessage:@"信息"];
}
- (IBAction)success:(id)sender {
    [XMGStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)error:(id)sender {
    [XMGStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    [XMGStatusBarHUD showLoading:@"正在加载"];
}

- (IBAction)hide:(id)sender {
    [XMGStatusBarHUD hide];
}

@end
