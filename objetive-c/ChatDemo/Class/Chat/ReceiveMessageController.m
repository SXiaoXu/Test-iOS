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

@property (nonatomic, assign) BOOL isttt;
@property (nonatomic,strong) AVIMConversation *conversation;
@end

@implementation ReceiveMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
/* 实现 delegate 方法，以处理消息修改和撤回的事件 */
- (void)conversation:(AVIMConversation *)conversation messageHasBeenUpdated:(AVIMMessage *)message {
    /* A message has been updated or recalled. */
    
    switch (message.mediaType) {
            case kAVIMMessageMediaTypeRecalled:
            NSLog(@"message 是一条撤回消息");
            break;
        default:
            NSLog(@"message 是一条更新消息");
            break;
    }
}
//注销
- (IBAction)close:(id)sender {
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 创建查询会话的 query
        AVIMConversationQuery *query = [self.client conversationQuery];
        [query getConversationById:@"5b50104a1b69e6003db8b944" callback:^(AVIMConversation *conversation, NSError *error) {
            
            self.conversation = conversation;
            
             NSLog(@"unreadMessagesCount==%lu",(unsigned long)conversation.unreadMessagesCount);
            
        }];
    }];
}
//登录
- (IBAction)open:(id)sender {

//    [self.conversation readInBackground];
    self.client = [[AVIMClient alloc] initWithClientId:@"Bob19215"];
    self.client.delegate = self;
    [self.client openWithCallback:^(BOOL succeeded, NSError * _Nullable error) {
        
    }];
}
- (void)conversation:(AVIMConversation *)conversation didUpdateForKey:(NSString *)key {
    if ([key isEqualToString:@"unreadMessagesCount"]) {
        NSUInteger unreadMessagesCount = conversation.unreadMessagesCount;
        /* 有未读消息产生，请更新 UI，或者拉取对话。 */
        
        NSLog(@"unreadMessagesCount==%lu",(unsigned long)unreadMessagesCount);
        
        //mid: "4zuruz_wSDGio_OafmV3lg"
    //cid: "5b50104a1b69e6003db8b944"
        
    }
    
}
#pragma mark - AVIMClientDelegate

// 接收消息的回调函数
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    
    
    NSLog(@"----%@", @(message.mediaType));
   
//    NSLog(@"-未读消息--->%ld", conversation.unreadMessagesCount);
//
//    [conversation readInBackground];
    
//      NSLog(@"-未读消息--->%ld", conversation.unreadMessagesCount);
}

-(void)conversation:(AVIMConversation *)conversation didReceiveCommonMessage:(AVIMMessage *)message{
    
    NSLog(@"----%@", message.content);
    
}


@end
