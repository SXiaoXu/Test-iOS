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
//短信测试
-(void)messageTest{
    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    options.templateName = @"小旭";
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
    options.templateVariables = @{ @"day": @"10" };
    options.templateName = @"小旭";
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

- (IBAction)vertify:(id)sender {
    [AVOSCloud verifySmsCode:@"465129" mobilePhoneNumber:@"18804208562" callback:^(BOOL succeeded, NSError *error) {
        if(succeeded){
            //验证成功
            NSLog(@"验证成功");
        }
    }];
}

@end
