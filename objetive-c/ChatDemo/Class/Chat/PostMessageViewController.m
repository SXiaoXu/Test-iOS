//
//  HomeViewController.m
//  ChatkitDemo
//
//  Created by Vivian on 2017/9/13.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "PostMessageViewController.h"


@interface PostMessageViewController ()<AVIMClientDelegate>
@property (nonatomic, strong) AVIMClient *clientA;
@property (nonatomic, strong) AVIMClient *clientB;
@property (nonatomic, strong) AVIMClient *clientC;

@property (weak, nonatomic) IBOutlet UITextField *AContent;
@property (weak, nonatomic) IBOutlet UITextField *BContent;
@property (weak, nonatomic) IBOutlet UILabel *AreceiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *BreceiveLabel;

@property (nonatomic, strong)  AVIMConversation *conversation;
@property (nonatomic, strong)  AVIMConversation *conversationTest;
@end

@implementation PostMessageViewController
#pragma mark -  Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Tom 创建了一个 client，用自己的名字作为 clientId
    self.clientA = [[AVIMClient alloc] initWithClientId:@"汤姆"];
    [self.clientA openWithCallback:^(BOOL succeeded, NSError * _Nullable error) {
        NSLog(@"---->%lu",(unsigned long)self.clientA.status);

    }];
    
    // Jerry 创建了一个 client，用自己的名字作为 clientId
//    self.clientB = [[AVIMClient alloc] initWithClientId:@"Jerry"];
//    // Jerry 创建了一个 client，用自己的名字作为 clientId
//    self.clientC = [[AVIMClient alloc] initWithClientId:@"Jimi"];
//    [self BReceiveMessageFromA];
//    [self AReceiveMessageFromB];
  
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AVAnalytics beginLogPageView:@"PageOne"];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [AVAnalytics endLogPageView:@"PageOne"];
}

#pragma mark - AVIMClientDelegate
// 接收消息的回调函数

- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    
    if ([message.attributes[@"type"]isEqualToString:@"AToB"]) {
        self.BreceiveLabel.text =[NSString stringWithFormat:@"收到的消息是:%@",message.text] ;
        
    }
    if ([message.attributes[@"type"]isEqualToString:@"BToA"]) {
        self.AreceiveLabel.text =[NSString stringWithFormat:@"收到的消息是:%@",message.text] ;
        
    }
    
    
}
- (void)conversation:(AVIMConversation *)conversation didReceiveCommonMessage:(AVIMMessage *)message{
      self.BreceiveLabel.text =[NSString stringWithFormat:@"收到的消息是:%@",message] ;
    
}
#pragma mark -  Event Response
#pragma mark -  Notification Motheds

#pragma mark -  Button Callbacks
- (IBAction)ASentBtnClick:(id)sender {
    if (self.AContent.text) {
        
        [self ASendMessageToB:self.AContent.text];

        //统计A发送的次数
        [AVAnalytics event:@"A_click"];
        
    
        //A发送的次数开始
        [AVAnalytics beginEvent:@"beginEventA"];

    }
}
- (IBAction)BSentBtnClick:(id)sender {
    if (self.BContent.text) {
        [self BSendMessageToA:self.BContent.text];
        //统计B发送的次数
        [AVAnalytics event:[NSString stringWithFormat:@"B_click"] label:@"点击了B"];
        //B发送的结束
        [AVAnalytics endEvent:@"endEventB"];
        
    }
}
#pragma mark -  GestureRecognizer
#pragma mark -  Private Methods
- (void)ASendMessageToB :(NSString *) content{
    
    NSLog(@"发的消息是----------->%@", content);
//       NSDate *date = [NSDate date];
        // Tom 建立了与 Jerry 的会话
        [self.clientA openWithCallback:^(BOOL succeeded, NSError *error) {
        NSDictionary *attributes = @{@"type":@"AToB",
                                     @"isSticky": @(YES),
                                     };
        [self.clientA createConversationWithName:@"对话对话对话123" clientIds:@[@"Jerry"] attributes:attributes options:AVIMConversationOptionNone  callback:^(AVIMConversation *conversation, NSError *error) {
            // Tom 发了一条消息给 Jerry
            self.conversation = conversation;
            [conversation sendMessage:[AVIMTextMessage messageWithText:content attributes:attributes] callback:^(BOOL succeeded, NSError *error) {
                
                if (succeeded) {
                    NSLog(@"发送成功！");
                    
                }
                if (error) {
                    NSLog(@"发送失败！");
                    
                }
        }];
    }];
    }];
 
    
}
- (void)BSendMessageToA :(NSString *) content{
    
//    NSDictionary *AToB = @{@"type":@"BToA"};
//    NSLog(@"发的消息是----------->%@", content);
//    // Tom 打开 client
//    [self.clientB openWithCallback:^(BOOL succeeded, NSError *error) {
//        [self.clientB createConversationWithName:@"我是对话的标题" clientIds:@[@"Tom"] callback:^(AVIMConversation *conversation, NSError *error) {
//            [conversation sendMessage:[AVIMTextMessage messageWithText:content attributes:AToB] callback:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"发送成功！");
//
//                }
//            }];
//        }];
//    }];
}

- (void)BReceiveMessageFromA {
     
    // 设置 client 的 delegate，并实现 delegate 方法
    self.clientB.delegate = self;
    // Jerry 打开 client
    [self.clientB openWithCallback:^(BOOL succeeded, NSError *error) {
        
    }];
}
- (void)AReceiveMessageFromB {
    // 设置 client 的 delegate，并实现 delegate 方法
    self.clientA.delegate = self;
    
    // Jerry 打开 client
    [self.clientA openWithCallback:^(BOOL succeeded, NSError *error) {
        
    }];
}




#pragma mark -  Public Methods
#pragma mark -  Getters and Getters


@end
