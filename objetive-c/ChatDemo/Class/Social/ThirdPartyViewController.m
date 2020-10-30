//
//  ThirdPartyViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/11/7.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "ThirdPartyViewController.h"
@interface ThirdPartyViewController ()


@end
@implementation ThirdPartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
   
}
//微博登录
- (IBAction)weibologin:(id)sender {
    
    [AVUser loginOrSignUpWithAuthData:@"" platform:LeanCloudSocialPlatformWeiBo block:^(AVUser * _Nullable user, NSError * _Nullable error) {
        
    }];
    
//    BOOL have = [AVOSCloudSNS isAppInstalledForType:AVOSCloudSNSSinaWeibo];
//    if (have) {
//        [AVOSCloudSNS loginWithCallback:^(id object, NSError *error) {
//            if (error) {
//            } else {
//
//                [AVUser loginWithAuthData:object platform:AVOSCloudSNSPlatformWeiBo block:^(AVUser *user, NSError *error) {
//
//
//                    if (error) {
//                        // 登录失败，可能为网络问题或 authData 无效
//                    } else {
//                        // 登录成功
//
//                    }
//                }];
//
//            }
//        } toPlatform:AVOSCloudSNSSinaWeibo];
//    }
}
//绑定AVUser
-(void)setupUser{
 
}
//QQ登录
- (IBAction)QQlogin:(id)sender {
    
    
    
}



@end
