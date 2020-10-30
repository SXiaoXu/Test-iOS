//
//  RestaurantController.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/21.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "RestaurantController.h"
#import "AVLiveQuery.h"
@interface RestaurantController ()<AVIMClientDelegate>

@property (nonatomic, strong) AVIMClient *client;
@property (nonatomic, strong) AVLiveQuery *liveQuery;

@property (nonatomic, strong) NSString *conID;
@end

@implementation RestaurantController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.client.delegate =self;
    self.view.backgroundColor = [UIColor whiteColor];
    // 初始化，然后登陆
    NSError *error;
     self.client = [[AVIMClient alloc] initWithClientId:@"tom" error:&error];
    if (error) {
        NSLog(@"init failed with error: %@", error);
    } else {
        [ self.client openWithCallback:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                // open succeeded
            }
        }];
    }
//    [AVUser requestMobilePhoneVerify:@"18804208562" withBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        if(succeeded){
//            //请求成功
//        }else{
//            //请求失败
//        }
//    }];
//    //    [AVUser loginAnonymouslyWithCallback:^(AVUser *user, NSError *error) {
//    //        // user 是新的匿名用户
//    //    }];
//    NSString  *username = @"Tom20200323";
//    NSString *password = @"cat!@#123";
//    //    currentUser.mobilePhoneNumber = @"18804208562";
//    [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
//        if (user != nil) {
//            // 登录成功
//            // 新建一个帖子对象
//                              AVObject *post = [AVObject objectWithClassName:@"Post"];
//                              [post setObject:@"这是我的第二条发言，谢谢大家！" forKey:@"title"];
//                              [post setObject:@"我最近喜欢看足球和篮球了。" forKey:@"content"];
//
//                              //新建一个 ACL 实例
//                              AVACL *acl = [AVACL ACL];
//                              [acl setPublicReadAccess:YES];// 设置公开的「读」权限，任何人都可阅读
//                              [acl setWriteAccess:YES forUser:[AVUser currentUser]];// 为当前用户赋予「写」权限
//                              [acl setWriteAccess:YES forUserId:@"55f1572460b2ce30e8b7afde"];
//
//                              post.ACL = acl;// 将 ACL 实例赋予 Post 对象
//                              [post save];
//        } else {
//            // 登录失败（可能是密码错误）
//        }
//    }];
//
                  
             

}
-(void)conversation:(AVIMConversation *)conversation didUpdateAt:(NSDate *)date byClientId:(NSString *)clientId updatedData:(NSDictionary *)data{
    NSLog(@"更新成功clientId---->%@", clientId);
    
}
- (void)conversation:(AVIMConversation *)conversation didReceiveCommonMessage:(AVIMMessage *)message{
    NSLog(@"message-content---->%@", message.content); // Jerry，起床了！
}


- (void)liveQuery:(AVLiveQuery *)liveQuery objectDidCreate:(id)object {
    if (liveQuery == self.liveQuery) {
        NSLog(@"对象被创建。");

    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    [AVUser logInWithUsernameInBackground:@"Tom04" password:@"123" block:^(AVUser *user, NSError *error) {
//      
//        // 构建对象
//        AVObject *todo = [AVObject objectWithClassName:@"Comment"];
//
//        // 为属性赋值
//        [todo setObject:@"马拉松报名" forKey:@"content"];
//        [todo setObject:user forKey:@"user"];
////        todo.fetchWhenSave =YES;
//        // 将对象保存到云端
//        [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (succeeded) {
//                // 成功保存之后，执行其他逻辑
//                
//                AVObject *userObject = todo[@"user"];
//                NSString *name = userObject[@"username"];
//             NSLog(@"保存成功。name：%@", name);
//                                            
//            } else {
//                // 异常处理
//            }
//        }];
//    }];
//    
//    
//
//[AVUser verifyMobilePhone:@"123456" withBlock:^(BOOL succeeded, NSError * _Nullable error) {
//    if(succeeded){
//        // mobilePhoneVerified 将变为 true
//    }else{
//        // 验证码不正确
//    }
//}];
}

- (void)imClientClosed:(nonnull AVIMClient *)imClient error:(NSError * _Nullable)error {
    
}


- (void)imClientPaused:(nonnull AVIMClient *)imClient {
    
}


- (void)imClientResumed:(nonnull AVIMClient *)imClient {
    
}


- (void)imClientResuming:(nonnull AVIMClient *)imClient {
    
}

- (void)tomQueryConversation {
    
    //    self.client = [[AVIMClient alloc] initWithClientId:@"BillGates"];
    //    self.client.delegate = self;
    //
    //    // Tom 打开 client
    //    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
    //        if(succeeded) {
    //            // 成功打开连接
    //            AVIMConversationQuery *query = [self.client conversationQuery];
    //            [query getConversationById:@"5cdd130edc0ab2de2901fcfa" callback:^(AVIMConversation *conversation, NSError *error) {
    //                if (error) {
    //                    NSLog(@"查询失败！error:%@",error);
    //
    //                }else{
    //                    NSLog(@"查询成功！id:%@",conversation.conversationId);
    //
    //                }
    //            }];
    //        }
    //    }];
    
    
    
    
}
- (void)testRole{
    
    // 设定角色本身的 ACL
    AVACL *roleACL = [AVACL ACL];
    [roleACL setPublicReadAccess:YES];
    [roleACL setWriteAccess:YES forUser:[AVUser currentUser]];
    // 创建角色，并且保存
    AVRole *administratorRole = [AVRole roleWithName:@"test" acl:roleACL];
    //    [[administratorRole users] addObject: [AVUser currentUser]];
    [administratorRole saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        // [self testQuery];
        if (succeeded) {
            
            
        }
    }];
    
}

@end






