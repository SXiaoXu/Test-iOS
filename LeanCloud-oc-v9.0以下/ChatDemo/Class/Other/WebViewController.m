//
//  WebViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/20.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自动对页面进行缩放以适应屏幕
    self.webView.scalesPageToFit = YES;
    
    NSURL* url = [NSURL URLWithString:@"https://tiy1psme.api.lncld.net/1.1/go/com.vivian.ChatkitDemo/classes/SearchApp/59c1ff2cfe88c2003cd5738b"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [self.webView loadRequest:request];//加载
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
