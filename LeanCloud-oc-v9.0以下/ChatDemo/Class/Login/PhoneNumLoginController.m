//
//  PhoneNumLoginController.m
//  ChatDemo
//
//  Created by Vivian on 2017/11/3.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "PhoneNumLoginController.h"

@interface PhoneNumLoginController ()
@property (nonatomic,strong) UIButton *buttonTest;
@property (nonatomic,strong) UIButton *buttonTest1;
@property (nonatomic,strong) UIButton *buttonTest2;
@property (nonatomic, strong) UITextField *text ;
@end

@implementation PhoneNumLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    //测试用户的密码是否存在
    //[self isExistPassWord];
    
    self.buttonTest = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 45)];
    self.buttonTest.backgroundColor = [UIColor greenColor];
    self.buttonTest.titleLabel.text = @"点我一下";
    [self.view addSubview:self.buttonTest];
    [self.buttonTest addTarget:self action:@selector(isExistPassWord) forControlEvents:UIControlEventTouchUpInside];
}

//测试用户的密码是否存在
-(void)isExistPassWord{
   
    self.buttonTest1 = [[UIButton alloc]initWithFrame:CGRectMake(20, 150, 100, 45)];
    self.buttonTest1.backgroundColor = [UIColor greenColor];
    self.buttonTest1.titleLabel.text = @"注册";
    self.buttonTest1.titleLabel.textColor = [UIColor blueColor];
    
    [self.view addSubview:self.buttonTest1];
    [self.buttonTest1 addTarget:self action:@selector(testTextField1) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonTest2 = [[UIButton alloc]initWithFrame:CGRectMake(20, 250, 100, 45)];
    self.buttonTest2.backgroundColor = [UIColor greenColor];
    self.buttonTest2.titleLabel.text = @"登录";
    self.buttonTest1.titleLabel.textColor = [UIColor blackColor];
    
    [self.view addSubview:self.buttonTest2];
    [self.buttonTest2 addTarget:self action:@selector(testTextField2) forControlEvents:UIControlEventTouchUpInside];
    
    self.text = [[UITextField alloc]initWithFrame:CGRectMake(20, 200, 100, 40)];
    [self.view addSubview:self.text];
    self.text.backgroundColor = [UIColor yellowColor];
    //[self.text addTarget:self action:@selector(testTextField) forControlEvents:UIControlEventTouchUpInside];
}
-(void)testTextField1{
    
    [AVOSCloud requestSmsCodeWithPhoneNumber:@"18804208562" callback:^(BOOL succeeded, NSError *error) {
        // 发送失败可以查看 error 里面提供的信息
        if (error) {
            NSLog(@"error--->%@",error);
        }
        if (succeeded) {
            NSLog(@"-----注册成功");
        }
    }];
}
-(void)testTextField2{
    
    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:@"18804208562" smsCode:self.text.text block:^(AVUser *user, NSError *error) {
        // 如果 error 为空就可以表示登录成功了，并且 user 是一个全新的用户
        if (error) {
            NSLog(@"error--->%@",error);
        }
        if (user) {
            NSLog(@"-----登录成功-user.sessionToken:%@--",user.sessionToken);
            
        }
    }];
    
}



@end
