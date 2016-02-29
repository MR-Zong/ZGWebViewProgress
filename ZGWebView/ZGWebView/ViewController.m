//
//  ViewController.m
//  ZGWebView
//
//  Created by Zong on 16/2/29.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGWebView.h"


@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(10, 64, 350, 250);
    
    ZGWebView *webView = [[ZGWebView alloc] init];
    webView.frame = contentView.bounds;
    // 一定要设置代理
    webView.delegate = self;
    
    [contentView addSubview:webView];
    [self.view addSubview:contentView];
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://baidu.com/"]];
    [webView loadRequest:req];
    
}


#pragma mark - <UIWebViewDelegate>
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL fi]];
    //    [webView loadRequest:urlRequest];
    NSLog(@"didFailLoadWithError");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
