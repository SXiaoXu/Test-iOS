//
//  HttpsViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/11/3.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "HttpsViewController.h"
#import <AFNetworking.h>
@interface HttpsViewController ()

@end

@implementation HttpsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 在 iOS SDK 中，AVCloud 提供了一系列静态方法来实现客户端调用云函数
    // 构建传递给服务端的参数字典
    //    NSDictionary *dicParameters = [NSDictionary dictionaryWithObject:@"夏洛特烦恼"
    //                                                              forKey:@"movie"];
    
//    // 调用指定名称的云函数 averageStars，并且传递参数
//    [AVCloud callFunctionInBackground:@"hello"
//                       withParameters:nil
//                                block:^(id object, NSError *error) {
//                                    if(error == nil){
//                                        // 处理结果
//                                        NSLog(@"-->%@",object);
//
//                                    } else {
//                                        // 处理报错
//                                    }
//                                }];
    
//    NSDictionary *dicParameters = [NSDictionary dictionaryWithObject:@"夏洛特烦恼"
//                                                              forKey:@"movie"];
    
    [AVCloud rpcFunctionInBackground:@"hello"
                      withParameters:nil
                               block:^(id object, NSError *error) {
                                   if(error == nil){
                                       // 处理结果
                                         NSLog(@"-->%@",object);
                                   }
                                   else {
                                       // 处理报错
                                   }
                               }];
}
    
-(void)httptest{
    //
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    NSString *url = @"https://api.leancloud.cn/1.1/stats/appmetrics?platform=iOS&start=20171010&end=20171018&metrics=active_user";
    //
    //NSString *url = @"https://9rxsgxhm.api.lncld.net/1.1/stats/appinfo";
    
    //    [manager.requestSerializer setValue:@"JMBPc7y4SUPRDrOSHXjXVMN7-gzGzoHsz" forHTTPHeaderField:@"X-LC-Id"];
    // [manager.requestSerializer setValue:@"ICvXCMbl0sgH3CY7vivQDvnK,master" forHTTPHeaderField:@"X-LC-Key"];
    //   [manager.requestSerializer setValue:@"cf5ede69e8bf91e1847c81adec6c9021,1508301205011" forHTTPHeaderField:@"X-LC-Sign"];
    //
    //  [manager.requestSerializer setValue:@"eab40b2cf8be18f70a0bc04c1786f61a,1508301205011,master" forHTTPHeaderField:@"X-LC-Sign"];
    //400
    //   [manager.requestSerializer setValue:@"Wib2dECd48h1FzivFrH628ju" forHTTPHeaderField:@"X-LC-Key"];
    
    //
    //  [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //
    //    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    //    }
    //         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //             NSLog(@"这里打印请求成功要做的事");
    //         }
    //         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
    //             NSLog(@"==========>%@",error);  //这里打印错误信息
    //         }];
    
}
@end
