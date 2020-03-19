//
//  NewsDetailController.m
//  NewsApp
//
//  Created by lugeek on 2020/3/11.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import "NewsDetailController.h"
#import <WebKit/WebKit.h>

@interface NewsDetailController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webview;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webview = [[WKWebView alloc] initWithFrame:CGRectZero];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectZero];
        self.progressView;
    })];
    
    // KVOControler 开源库
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:@"NewsDetailController"];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.baidu.com/"]]];
}

- (void)viewDidLayoutSubviews
{
    self.webview.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height);
    self.progressView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, 1);
}

- (void)dealloc
{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    self.progressView.hidden = YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == @"NewsDetailController") {
        self.progressView.progress = self.webview.estimatedProgress;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
