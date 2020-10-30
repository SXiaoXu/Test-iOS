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
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (nonatomic, strong) VVTabBarController *homeVC;

@property (weak, nonatomic) IBOutlet UITextField *imageCodeText;

@property (weak, nonatomic) IBOutlet UIImageView *imageCode;
@property (weak, nonatomic) IBOutlet UITextField *registerSucceedVerifyCode;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;


@property (weak, nonatomic) IBOutlet UITextField *passwordForLogin;

@end

@implementation LoginViewController
{

    AVCaptchaDigest * digst;

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AVAnalytics beginLogPageView:@"Login"];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [AVAnalytics endLogPageView:@"Login"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//     [AVUser logOut];  //登出

    [self.userNameTextField addTarget:self action:@selector(textFieldDidclick) forControlEvents:UIControlEventTouchUpInside];
    [self.passwordTextfield addTarget:self action:@selector(textFieldDidclick) forControlEvents:UIControlEventTouchUpInside];

}

- (IBAction)startImageCode:(id)sender {
    //获取图形验证码
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
//开始验证
- (IBAction)startVerity:(id)sender {
    
    [AVCaptcha verifyCaptchaCode:self.imageCodeText.text
                forCaptchaDigest:digst
                        callback:^(NSString * _Nullable validationToken, NSError * _Nullable error) {
                            /* validationToken 可用短信认证 */
                            if (error) {
                                NSLog(@"验证失败----->%@",error);

                            }else{
                                NSLog(@"验证成功-----");
                            }
                        }];

}



- (void)textFieldDidclick{

}
- (IBAction)loginBtnClick:(id)sender {

        NSString *username = self.userNameTextField.text;
        NSString *password = self.passwordTextfield.text;
        if (username && password) {
            [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
                if (error) {
                    NSLog(@"登录失败 %@", error);
                } else {
                    [self presentViewController:self.homeVC animated: YES completion:nil];
                }
            }];
    }
    
}
- (IBAction)registerBtnClick:(id)sender {
        
        NSString *username = self.userNameTextField.text;
        NSString *password = self.passwordTextfield.text;
        if (username && password ) {
            AVUser *user = [AVUser user];
            user.username = username;
            user.password = password;
            user.mobilePhoneNumber = self.phoneNumber.text;
            [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    [self presentViewController:self.homeVC animated: YES completion:nil];
//
//                    AVFile *file = [AVFile fileWithURL:@"http://ac-jmbpc7y4.clouddn.com/b1b7d3f5057d2a0bd171.jpeg"];
//                    [file getData];// 注意这一步很重要，这是把图片从原始地址拉去到本地
//                    [file save];
                    
                    
                    
                    
                } else {
                    NSLog(@"注册失败 %@", error);
                }
            }];
        }
    
    
}
- (IBAction)verifyPhonenumber:(id)sender {
    //注册成功验证手机号
    [AVUser verifyMobilePhone:self.registerSucceedVerifyCode.text withBlock:^(BOOL succeeded, NSError *error) {
        //验证结果
        if (error) {
            NSLog(@"-----验证失败 %@-------", error);
        } else {
             NSLog(@"--------验证成功");
        }
    }];
}
//手机号验证码登录-获取验证码
- (IBAction)getloginCodeBtn:(id)sender {
    [AVOSCloud requestSmsCodeWithPhoneNumber:@"18804208562" callback:^(BOOL succeeded, NSError *error) {
        // 发送失败可以查看 error 里面提供的信息
    }];
}
//手机号验证码登录
- (IBAction)loginBtn:(id)sender {
    
    NSString *str = self.passwordForLogin.text;
    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:@"18804208562" smsCode:str block:^(AVUser *user, NSError *error) {
        if (error) {
            //注册失败
        } else {
         
        }
        
    }];
}




-(UIViewController *)homeVC{
    if(!_homeVC){
        _homeVC = [[VVTabBarController alloc]init];
    }
    return _homeVC;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
