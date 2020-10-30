//
//  SendMessageController.m
//  ChatDemo
//
//  Created by XiaoXu on 2018/1/4.
//  Copyright © 2018年 NineNine. All rights reserved.
//

#import "SendMessageController.h"

@interface SendMessageController ()<AVIMClientDelegate>
@property (nonatomic, strong) AVIMClient *client;

/**  */
@property (nonatomic,strong) AVIMConversation *conversation;
@end

@implementation SendMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)sendMessage:(id)sender {
    
    // Tom 创建了一个 client，用自己的名字作为 clientId
    self.client = [[AVIMClient alloc] initWithClientId:@"Tom19215"];
    
    // Tom 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 创建名称为「猫和老鼠」的会话，并附加会话属性
        NSDictionary *attributes = @{
                                     @"type": @"private",
                                     @"isSticky": @(YES)
                                     };
        [self.client createConversationWithName:@"猫和老鼠" clientIds:@[@"Bob19215"] attributes:attributes options:AVIMConversationOptionNone callback:^(AVIMConversation *conversation, NSError *error) {
            if (succeeded) {
                NSLog(@"创建成功！");
                //5bc952db808ca40072735dc1
                AVIMMessageOption *option = [[AVIMMessageOption alloc] init];
                option.pushData = @{@"alert" : @"有一条", @"sound" : @"message.mp3", @"badge" : @1, @"custom-key" : @"由用户添加的自定义属性，custom-key 仅是举例，可随意替换"};
                [conversation sendMessage:[AVIMTextMessage messageWithText:@"耗子，起床！" attributes:nil] option:option callback:^(BOOL succeeded, NSError * _Nullable error) {
                    // 在这里处理发送失败或者成功之后的逻辑
                }];
               
            }
        }];
    }];
    
}

- (IBAction)recallMessage:(id)sender {
//    self.client = [[AVIMClient alloc] initWithClientId:@"Tom"];
//    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
//        // Tom 创建查询会话的 query
//        AVIMConversationQuery *query = [self.client conversationQuery];
//        [query getConversationById:@"5b18a79e75657100448986ff" callback:^(AVIMConversation *conversation, NSError *error) {
//            // 查询对话中最后 10 条消息
//            [conversation queryMessagesWithLimit:10 callback:^(NSArray * _Nullable array, NSError * _Nullable error) {
//                for (int i = 0; i < array.count; i++) {
//                    AVIMMessage *mess = array[i];
//                    [conversation recallMessage:mess callback:^(BOOL succeeded, NSError * _Nullable error, AVIMRecalledMessage * _Nullable recalledMessage) {
//                        if (succeeded) {
//                            NSLog(@"Message has been recalled.id===%@",mess.messageId);
//                            //LMEo_xMES4WBEQAWQpSMmQ
//
//                        }
//
//                    }];
//                }
//            }];
//
//        }];
//    }];
}
- (IBAction)SomeTestMessage:(id)sender {
//    // Tom 创建了一个 client，用自己的名字作为 clientId
//    self.client = [[AVIMClient alloc] initWithClientId:@"Tom"];
//
//    // Tom 打开 client
//    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
//        // Tom 创建查询会话的 query
//        AVIMConversationQuery *query = [self.client conversationQuery];
//        // Tom 获取 id 为 2f08e882f2a11ef07902eeb510d4223b 的会话
//        [query getConversationById:@"5b18a79e75657100448986ff" callback:^(AVIMConversation *conversation, NSError *error) {
//            // 查询对话中最后 10 条消息
//            [conversation queryMessagesWithLimit:10 callback:^(NSArray *objects, NSError *error) {
//                NSLog(@"查询成功！");
//
//            }];
//        }];
//    }];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //发消息
   
    
}
- (void)tomSendMessageToJerry {
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        AVIMConversationQuery *query = [self.client conversationQuery];
        
        [query getConversationById:@"5ae1b1d39f545400457a657a" callback:^(AVIMConversation *conversation, NSError *error) {
            
            NSInteger x = arc4random() % 100;
            [conversation sendMessage:[AVIMTextMessage messageWithText:[NSString stringWithFormat: @"发第%ld条消息",(long)x] attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");
                    
                }
            }]; }];
    }];
}
- (void)williamKickHarry {
    
    // William 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        AVIMConversationQuery *query = [self.client conversationQuery];
        [query getConversationById:@"5a7fe9dd1579a300383c7b66" callback:^(AVIMConversation *conversation, NSError *error) {
            [conversation removeMembersWithClientIds:@[@"AA"] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"踢人成功！");
                }
            }];
        }];
    }];
}

-(void)tomQueryMessagesWithMediaType{
    
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 创建查询会话的 query
        AVIMConversationQuery *query = [self.client conversationQuery];
        [query findConversationsWithCallback:^(NSArray *objects, NSError *error) {
            
            NSArray *arr = [NSArray arrayWithObjects: objects, nil];
            NSLog(@"%lu",(unsigned long)arr.count);
            
        }];
        
    }];
    
    
}
@end

