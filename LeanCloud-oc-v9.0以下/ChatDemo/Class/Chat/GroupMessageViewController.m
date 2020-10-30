//
//  GroupMessageViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/14.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "GroupMessageViewController.h"

@interface GroupMessageViewController ()<AVIMClientDelegate>
@property (nonatomic, strong) AVIMClient *clientA;
@property (nonatomic, strong) AVIMClient *clientB;
@property (nonatomic, strong) AVIMClient *clientC;

@property (weak, nonatomic) IBOutlet UITextField *AContent;

@property (weak, nonatomic) IBOutlet UITextField *BContent;

@property (weak, nonatomic) IBOutlet UITextField *CContent;

@property (weak, nonatomic) IBOutlet UITextView *showText;

@property (nonatomic, strong) AVIMConversation *conversation;

@property (nonatomic, strong) NSString *records ;
@property (weak, nonatomic) IBOutlet UILabel *lastmessageLabel;
@end



@implementation GroupMessageViewController
#pragma mark -  Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.records = @"";
    self.clientA = [[AVIMClient alloc] initWithClientId:@"Tom"];
    self.clientB = [[AVIMClient alloc] initWithClientId:@"Bob"];
    self.clientC = [[AVIMClient alloc] initWithClientId:@"Harry"];
    
    [self bobReceiveMessageFromFriends];
    
}
#pragma mark - AVIMClientDelegate

//- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
//  //  NSDictionary *type = @{@"type":@"group",@"who":@"Tom"};
//    if ([message.attributes[@"type"]isEqualToString:@"group"]) {
//        NSString *tempStr = self.records;
//        NSString * newMessage = [NSString stringWithFormat:@"%@收到%@的消息:%@\n",conversation.clientId,message.attributes[@"who"],message.text];
//        self.records = [tempStr stringByAppendingString:newMessage];
//
//        self.showText.text =self.records ;
//        NSLog(@"conversation.lastMessage------>%@", conversation.lastMessage.content);
//        self.lastmessageLabel.text = conversation.lastMessage.content;
//
//    }
//}
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    
    
    [conversation fetchWithCallback:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"conversation.lastMessage%@", conversation.lastMessage.content);
            //   [self receiveMessage:message conversation:conversation];
        }
    }];
    
}

#pragma mark -  Event Response
#pragma mark -  Notification Motheds
#pragma mark -  Button Callbacks
- (IBAction)StartGroupChatClick:(id)sender {
    
    [self tomCreateConversationWithFriends];
    
}
- (IBAction)ASentClick:(id)sender {
    NSDictionary *type = @{@"type":@"group",@"who":@"Tom"};

    if (self.AContent.text) {
        AVIMTextMessage *reply = [AVIMTextMessage messageWithText:self.AContent.text attributes:type];
        
        [self.conversation sendMessage:reply callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"回复成功！");
                
            }
        }];
    }
}
- (IBAction)BSentClick:(id)sender {
    NSDictionary *type = @{@"type":@"group",@"who":@"Bob"};

    if (self.BContent.text) {
        AVIMTextMessage *reply = [AVIMTextMessage messageWithText:self.BContent.text attributes:type];
        
        [self.conversation sendMessage:reply callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"回复成功！");
                
            }else{
                NSLog(@"回复失败！");

            }
        }];
    }
}
- (IBAction)CsentClick:(id)sender {
    NSDictionary *type = @{@"type":@"group",@"who":@"Harry"};

    if (self.CContent.text) {
        AVIMTextMessage *reply = [AVIMTextMessage messageWithText:self.CContent.text attributes:type];
        [self.conversation sendMessage:reply callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"回复成功！");
            }
        }];
    }
}
#pragma mark -  GestureRecognizer
#pragma mark -  Private Methods
- (void)tomCreateConversationWithFriends {
    
    NSDictionary *type = @{@"type":@"group",@"who":@"Tom"};
    //NSLog(@"发的消息是----------->%@", content);
    [self.clientA openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 建立了与朋友们的会话
        NSArray *friends = @[@"Jerry", @"Bob", @"Harry", @"William",@"xiaoxu",@"qqqq"];
        [self.clientA createConversationWithName:@"Tom and friends" clientIds:friends callback:^(AVIMConversation *conversation, NSError *error) {
            // Tom 发了一条消息给朋友们
            self.conversation = conversation;
            [conversation sendMessage:[AVIMTextMessage messageWithText:@"你们在哪儿？" attributes:type] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");
                }
            }];
        }];
    }];
}

- (void)bobReceiveMessageFromFriends {
    
    // 设置 client 的 delegate，并实现 delegate 方法
    self.clientB.delegate = self;
    self.clientC.delegate = self;
    self.clientA.delegate = self;
    // Bob 打开 client
    [self.clientA openWithCallback:^(BOOL succeeded, NSError *error) {
        // ...
    }];
    [self.clientB openWithCallback:^(BOOL succeeded, NSError *error) {
        // ...
    }];
    [self.clientC openWithCallback:^(BOOL succeeded, NSError *error) {
        // ...
    }];
}

#pragma mark -  Public Methods
#pragma mark -  Getters and Getters









@end
