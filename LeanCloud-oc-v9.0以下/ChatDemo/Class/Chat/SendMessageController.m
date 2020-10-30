//
//  SendMessageController.m
//  ChatDemo
//
//  Created by XiaoXu on 2018/1/4.
//  Copyright © 2018年 NineNine. All rights reserved.
//

#import "SendMessageController.h"

@interface SendMessageController ()
@property (nonatomic, strong) AVIMClient *client;

@end

@implementation SendMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //发消息

//    [self williamKickHarry];
    
    [self tomSendMessageToJerry];

}
- (void)tomSendMessageToJerry {
    // Tom 创建了一个 client，用自己的名字作为 clientId
    self.client = [[AVIMClient alloc] initWithClientId:@"Vivian"];
//    AVIMMessageOption *option = [[AVIMMessageOption alloc] init];
//    option.will = YES;
//
//    AVIMMessage *willMessage = [AVIMTextMessage messageWithText:@"I'm offline." attributes:nil];
//
    ////            [conversation sendMessage:willMessage option:option callback:^(BOOL succeeded, NSError * _Nullable error) {
    //                if (succeeded) {
    //                    NSLog(@"Will message has been sent.");
    //
    //                }
    //            }];

    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        [self.client createConversationWithName:@"测试遗愿消息" clientIds:@[@"AA"] callback:^(AVIMConversation *conversation, NSError *error) {

            NSInteger x = arc4random() % 100;
            [conversation sendMessage:[AVIMTextMessage messageWithText:[NSString stringWithFormat: @"发第%ld条消息",(long)x] attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");

                }
            }];
        }];
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
@end
