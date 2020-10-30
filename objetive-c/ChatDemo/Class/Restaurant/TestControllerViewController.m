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
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self tomSendMessageToJerry];
    
}
- (void)tomQueryConversation {
    
    self.client = [[AVIMClient alloc] initWithClientId:@"Tom"];
    // Tom 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 查询 id 为 551260efe4b01608686c3e0f 的会话
        AVIMConversationQuery *query = [self.client conversationQuery];
        // Tom 设置查询最近 20 个活跃对话
        query.limit = 100;
        /* 指定返回对话的最后一条消息 */
        //        query.cachePolicy = kAVCachePolicyCacheOnly;
        [query findConversationsWithCallback:^(NSArray *objects, NSError *error) {
            NSLog(@"找到 %ld 个对话！", [objects count]);
            //            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"标题" message:test delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
            //            [alertview show];
        }];
    }];
    
    
}
- (void)tomSendMessageToJerry {
//     AVFile *file =[AVFile fileWithRemoteURL:[NSURL URLWithString:@"http://ww3.sinaimg.cn/bmiddle/596b0666gw1ed70eavm5tg20bq06m7wi.gif"]];
//
    AVFile *file = [AVFile fileWithRemoteURL:[NSURL URLWithString:@"文件-url"]];
    [file getThumbnail:YES width:100 height:100 withBlock:^(UIImage *image, NSError *error) {
        // code
    }];
    // Tom 创建了一个 client，用自己的名字作为 clientId
    self.client = [[AVIMClient alloc] initWithClientId:@"Tom"];
    
    // Tom 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 建立了与 Jerry 的会话
        [self.client createConversationWithName:@"猫和老鼠" clientIds:@[@"Jerry"] callback:^(AVIMConversation *conversation, NSError *error) {
            // Tom 发了一条消息给 Jerry
         AVIMTextMessage * message = [AVIMTextMessage messageWithText:@"耗子，起床！" attributes:nil];
            [conversation sendMessage:message callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功:-->%@",message.messageId);
                    
                }
            }];
        }];
    }];
}
- (IBAction)sendSMSCode:(id)sender {
    [AVOSCloud requestSmsCodeWithPhoneNumber:@"18804208562" callback:^(BOOL succeeded, NSError *error) {
        // 发送失败可以查看 error 里面提供的信息

    }];
    
    [AVSMS requestShortMessageForPhoneNumber:@"13577778888" options:nil callback:^(BOOL succeeded, NSError * _Nullable error) {
        // 发送失败可以查看 error 里面提供的信息
    }];
    
   
    //   AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    //    options.templateName = @"xiaoxuTest";
    //    options.signatureName = @"xsui";
    //
    //    [AVSMS requestShortMessageForPhoneNumber:@"18804208562"
    //                                     options:options
    //                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
    //                                        if (succeeded) {
    //                                            /* 请求成功 */
    //
    //                                        } else {
    //                                            /* 请求失败 */
    //
    //                                        }
    //                                    }];
    //    [AVUser requestMobilePhoneVerify:@"18804208562" withBlock:^(BOOL succeeded, NSError *error) {
    //        if(succeeded){
    //            //调用成功
    //        }else{
    //            NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
    //            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //            if (object) {
    //                // do something.
    //            }
    //
    //        }
    //    }];
    
}

- (IBAction)gotoVetify:(id)sender {
    
    
    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:@"18804208562" smsCode:@"854033" block:^(AVUser *user, NSError *error) {

    }];
 
}
@end

