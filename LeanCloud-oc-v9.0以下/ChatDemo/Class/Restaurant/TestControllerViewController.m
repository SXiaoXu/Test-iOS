//
//  TestControllerViewController.m
//  ChatDemo
//
//  Created by XiaoXu on 2017/12/18.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "TestControllerViewController.h"

@interface TestControllerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (nonatomic, strong) AVIMClient *client;
@end
#define kConversationId @"59e452f97565710046a36343"
@implementation TestControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.client = [[AVIMClient alloc] initWithClientId:@"Jerry"];

    self.view.backgroundColor =[UIColor whiteColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self tomQueryConversation];
}
- (void)tomQueryConversation {
    // Tom 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 查询 id 为 551260efe4b01608686c3e0f 的会话
        AVIMConversationQuery *query = [self.client conversationQuery];
        /* 指定返回对话的最后一条消息 */
                query.option = AVIMConversationQueryOptionWithMessage;
//        query.cachePolicy = kAVCachePolicyNetworkElseCache;

        [query getConversationById:kConversationId  callback:^(AVIMConversation *conversation, NSError *error) {
            if (conversation) {
                NSLog(@"查询成功！");
                NSLog(@"conversation.lastMessage**************************==>%@",conversation.lastMessage.content);

                [conversation sendMessage:[AVIMTextMessage messageWithText:@"Jerry说了什么新新新" attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                                    if (succeeded) {
                                        NSLog(@"发送成功！");
                                    }
                }];
            }
        }];
    }];
}

- (IBAction)sendSMSCode:(id)sender {
    
    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    
    options.templateName = @"xiaoxuTest";
    options.signatureName = @"xsui";
//    options.templateVariables = @{ @"day": @"123456" };
    
    [AVSMS requestShortMessageForPhoneNumber:@"18802785364"
                                     options:options
                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
                                        
                                        if (succeeded) {
                                            /* 请求成功 */
                                           
                                        } else {
                                            /* 请求失败 */
                                        }
                                    }];

}

- (IBAction)gotoVetify:(id)sender {
    

        
        
        [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
            // Tom 查询 id 为 551260efe4b01608686c3e0f 的会话
            AVIMConversationQuery *query = [self.client conversationQuery];
            /* 指定返回对话的最后一条消息 */
            query.option = AVIMConversationQueryOptionWithMessage;
//            query.cachePolicy = kAVCachePolicyNetworkElseCache;
            
            [query getConversationById:kConversationId  callback:^(AVIMConversation *conversation, NSError *error) {
                NSLog(@"conversation.lastMessage**************************==>%@",conversation.lastMessage.content);
                    
                
                
            }];
        }];
        

}





@end
