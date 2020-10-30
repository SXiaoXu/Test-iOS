//
//  ReceiveMessageController.m
//  ChatDemo
//
//  Created by XiaoXu on 2018/1/4.
//  Copyright © 2018年 NineNine. All rights reserved.
//

#import "ReceiveMessageController.h"

@interface ReceiveMessageController ()<AVIMClientDelegate>
@property (nonatomic, strong) AVIMClient *client;
@end

@implementation ReceiveMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
//注销
- (IBAction)close:(id)sender {
    [self.client closeWithCallback:^(BOOL succeeded, NSError * _Nullable error) {
        
          NSLog(@"退出登录");
    }];
}
//登录
- (IBAction)open:(id)sender {
    [self jerryReceiveMessageFromTom];

}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//}
- (void)jerryReceiveMessageFromTom {
    // Jerry 创建了一个 client，用自己的名字作为 clientId
    self.client = [[AVIMClient alloc] initWithClientId:@"AA"];
    
    // 设置 client 的 delegate，并实现 delegate 方法
    self.client.delegate = self;
    
    // Jerry 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        NSLog(@"登录");
    }];
}

#pragma mark - AVIMClientDelegate

// 接收消息的回调函数
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    
    NSLog(@"----%@", message.text);
    
}
//
//- (void)conversation:(AVIMConversation *)conversation didUpdateForKey:(NSString *)key {
//    if ([key isEqualToString:@"unreadMessagesCount"]) {
//        NSUInteger unreadMessagesCount = conversation.unreadMessagesCount;
//        /* 有未读消息产生，请更新 UI，或者拉取对话。 */
//        NSLog(@"-未读消息--->%ld", unreadMessagesCount);
//        
//    }
//}
@end
