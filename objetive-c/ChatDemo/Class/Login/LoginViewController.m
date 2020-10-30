//
//  LoginViewController.m
//  ChatkitDemo
//
//  Created by Vivian on 2017/9/13.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "LoginViewController.h"
#import "PostMessageViewController.h"
#import "VVTabBarController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageCode;
@property (weak, nonatomic) IBOutlet UITextField *imageCodeText;


@end
@implementation LoginViewController
{
    AVCaptchaDigest * digst;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)resetEmail:(id)sender {
//
//    AVUser *user = [AVUser user];// 新建 AVUser 对象实例
//    user.username = @"Tom201808";// 设置用户名
//    user.password =  @"123";// 设置密码
//
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            // 注册成功
//            [AVUser logInWithUsernameInBackground:@"Tom201808" password:@"123" block:^(AVUser * _Nullable user, NSError * _Nullable error) {
//
//                if (user) {
//                    NSLog(@"登录成功");
//
//                }
//
//
//            }];
//        } else {
//            // 失败的原因可能有多种，常见的是用户名已经存在。
//        }
//    }];
    [self vertifyEmail];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [AVUser logInWithUsernameInBackground:@"小丸子" password:@"987" block:^(AVUser *user, NSError *error) {
        if (user != nil) {
          
            [[AVUser currentUser] getFollowersAndFollowees:^(NSDictionary *dict, NSError *error) {
                NSArray *followers=dict[@"followers"];
                NSArray *followees=dict[@"followees"];
                
                NSLog(followers);
                
            }];
            
            
        } else {
            
        }
    }];
    
    
 
}

//验证邮箱
-(void)vertifyEmail{
//    AVUser *user = [AVUser user];// 新建 AVUser 对象实例
//    user.username = @"email1";// 设置用户名
//    user.password =  @"123";// 设置密码
//    user.email = @"284898541@qq.com";// 设置邮箱
//
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            // 注册成功
//
//        } else {
//            // 失败的原因可能有多种，常见的是用户名已经存在。
//        }
//    }];
    [AVSMS requestShortMessageForPhoneNumber:@"18804208562" options:nil callback:^(BOOL succeeded, NSError * _Nullable error) {
        // 发送失败可以查看 error 里面提供的信息
        
    }];
    
}
 //获取图形验证码
- (IBAction)getImageCode:(id)sender {
    AVCaptchaRequestOptions *options = [[AVCaptchaRequestOptions alloc] init];
    
    options.width = 100;
    options.height = 50;
    [AVCaptcha requestCaptchaWithOptions:options
                                callback:^(AVCaptchaDigest * _Nullable captchaDigest, NSError * _Nullable error) {
                                    /* URL string of captcha image. */
                                    NSString *url = captchaDigest.URLString;
                                    //NSString *code = captchaDigest.nonce;
                                    [self.imageCode sd_setImageWithURL:[NSURL URLWithString:url]];
                                    
                                    digst = captchaDigest;
                                }];
    
}

- (IBAction)vertifyImageCode:(id)sender {
//    [AVCaptcha verifyCaptchaCode: self.imageCodeText.text
//                forCaptchaDigest:digst
//                        callback:^(NSString * _Nullable validationToken, NSError * _Nullable error) {
//                            /* validationToken 可用短信认证 */
//                        }];
//}
    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:@"18804208562" smsCode:@"864620" block:^(AVUser *user, NSError *error) {
        // 如果 error 为空就可以表示登录成功了，并且 user 是一个全新的用户
        
    }];

}
@end

