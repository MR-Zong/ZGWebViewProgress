//
//  ZGWebView.m
//  ZGWebView
//
//  Created by Zong on 16/2/29.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGWebView.h"
#import "NJKWebViewProgressView.h"
#import "NJKWebViewProgress.h"

@interface ZGWebView () <NJKWebViewProgressDelegate>

@property (strong, nonatomic) NJKWebViewProgress *progressProxy;

@end

@implementation ZGWebView
{
    NJKWebViewProgressView *_progressView;
}

- (void)setupNJKWebViewProgressView
{
    
    CGFloat progressBarHeight = 2.f;
    CGRect barFrame = CGRectMake(0, 0, self.bounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:_progressView];
}

- (void)setDelegate:(id<UIWebViewDelegate>)delegate
{
    [super setDelegate:self.progressProxy];
    _progressProxy.webViewProxyDelegate = delegate;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!_progressView.window) {
        [self setupNJKWebViewProgressView];
    }
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
}

#pragma mark - lazyload
- (NJKWebViewProgress *)progressProxy
{
    if (!_progressProxy) {
        _progressProxy = [[NJKWebViewProgress alloc] init];
        _progressProxy.progressDelegate = self;
    }
    return _progressProxy;
}


@end
