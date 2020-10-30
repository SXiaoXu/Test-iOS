//
//  ShortMessageController.m
//  ChatDemo
//
//  Created by Vivian on 2017/11/3.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "ShortMessageController.h"

@interface ShortMessageController ()

@end

@implementation ShortMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    //短信测试
//    [self messageTest];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    options.type = AVShortMessageTypeVoice;
    [AVSMS requestShortMessageForPhoneNumber:@"18804208562"
                                     options:options
                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
                                        if (succeeded) {
                                            NSLog(@"A voice short message has been sent.");
                                        }
                                    }];
//
//    options.TTL = 10;                      // 验证码有效时间为 10 分钟
////    options.applicationName = @"应用名称";  // 应用名称
////    options.operation = @"某种操作";        // 操作名称
//    [AVSMS requestShortMessageForPhoneNumber:@"+18312336081"
//                                     options:options
//                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
//                                        if (succeeded) {
//                                            /* 请求成功 */
//                                        } else {
//                                            /* 请求失败 */
//                                            NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
//                                            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//                                            if (object) {
//                                                // do something.
//                                            }
//                                        }
//                                    }];
//    [AVUser logInWithUsernameInBackground:@"444" password:@"444" block:^(AVUser *user, NSError *error) {
//        if (user != nil) {
//            [user setObject:@"18804208562" forKey:@"mobilePhoneNumber"];
//            [user save];
//        } else {
//
//        }
//
//    }];
     }
//短信测试
-(void)messageTest{
    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    options.templateName = @"xiaoxuTest";
    options.signatureName = @"xsui";
    options.templateVariables = @{ @"day": @"10" };

    [AVSMS requestShortMessageForPhoneNumber:@"18804208562"
                                     options:options
                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
                                        if (succeeded) {
                                            /* 请求成功 */

                                        } else {
                                            /* 请求失败 */

                                        }
                                    }];
}
- (IBAction)request:(id)sender {
    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    options.type = AVShortMessageTypeVoice;
    [AVSMS requestShortMessageForPhoneNumber:@"18804208562"
                                     options:options
                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
                                        if (succeeded) {
                                            NSLog(@"A voice short message has been sent.");
                                            
                                        }
                                    }];
    
//    [AVUser requestMobilePhoneVerify:@"18804208562" withBlock:^(BOOL succeeded, NSError *error) {
//        if(succeeded){
//            //调用成功
//        }else{
//
//        }
//    }];
//    [AVUser requestPasswordResetWithPhoneNumber:@"18804208562" block:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//
//        } else {
//
//        }
//    }];
}

- (IBAction)vertify:(id)sender {
//    [AVOSCloud verifySmsCode:@"465129" mobilePhoneNumber:@"18804208562" callback:^(BOOL succeeded, NSError *error) {
//        if(succeeded){
//            //验证成功
//            NSLog(@"验证成功");
//        }
//    }];
    
    [AVOSCloud verifySmsCode:@"854033" mobilePhoneNumber:@"18804208562" callback:^(BOOL succeeded, NSError *error) {
        if(succeeded){
            //验证成功
        }
    }];
//    [AVUser resetPasswordWithSmsCode:@"465129" newPassword:@"123" block:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//
//        } else {
//
//        }
//    }];
}

@end
