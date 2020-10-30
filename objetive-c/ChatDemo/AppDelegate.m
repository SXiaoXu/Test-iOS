//
//  AppDelegate.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/14.
//  Copyright © 2017年 NineNine. All rights reserved.

#import "AppDelegate.h"
#import "VVTabBarController.h"
#import <UserNotifications/UserNotifications.h>
#import <AFNetworking/AFNetworking.h>
//@interface AppDelegate ()<UNUserNotificationCenterDelegate,WXApiDelegate>
@interface AppDelegate ()<UNUserNotificationCenterDelegate>
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //开启调试日志
//    [AVOSCloud setVerbosePolicy:kAVVerboseNone];
    //    [AVAnalytics setAnalyticsEnabled:NO];
    //flutter
//            [AVOSCloud setApplicationId:@"1eUivazFXYwJvuGpPl2LE4uY-gzGzoHsz" clientKey:@"nLMIaQSwIsHfF206PnOFoYYa"];
//    //USA2
//
//            [AVOSCloud setApplicationId:@"lTRbfngpA7Gl4Rpmv41a4l8t-MdYXbMMI" clientKey:@"Tbp3JxaXsWi3dixdGxlH85kg"];
//    //  华东节点
//        [AVOSCloud setApplicationId:@"uwWkfssEBRtrxVpQWEnFtqfr-9Nh9j0Va" clientKey:@"9OaLpoW21lIQtRYzJya4WHUR"];
//      华北
//        [AVOSCloud setApplicationId:@"JMBPc7y4SUPRDrOSHXjXVMN7-gzGzoHsz" clientKey:@"Wib2dECd48h1FzivFrH628ju"];
    //    云引擎
    //    [AVOSCloud setApplicationId:@"tiy1PsmEtJJ1QtHvHzVQLVod-gzGzoHsz" clientKey:@"m6HkmlWP3tclhnbbeWurifNl"];
    //美国新用户
//    [AVOSCloud setApplicationId:@"4fuSYNrsaKeDgnv1BvoCY9jy-MdYXbMMI" clientKey:@"JkzIoLjdicdmoEr0RIw3zoRN"];
    //美国节点
//         [AVOSCloud setApplicationId:@"SmlpUhrPmLmDKWyKUpY0WzsR-MdYXbMMI" clientKey:@"Y2uitmBsIpQN6erwygysgo31"];
    //    SNSTest
    //    [AVOSCloud setApplicationId:@"I94is3iS8CzyLsY4lmYz2HjT-gzGzoHsz" clientKey:@"yDObYfeTC9Y0e1aqT7nrWJgu"];
    //LeanTicket
    //    [AVOSCloud setApplicationId:@"K8zekwNX6veIEy3vv33w86Go-gzGzoHsz" clientKey:@"Kk4CzCi3KPyl9EzRzT4Tmf1X"];
//    test
//        [AVOSCloud setApplicationId:@"JJBy8Txj78kOe31y4vrWCODy-gzGzoHsz" clientKey:@"X4f1deUpFnl7E1fJEcWgoTrl"];
    //MyTicket
//     [AVOSCloud setApplicationId:@"p5L27RdjnqgN2WEHc5ShSPTW-gzGzoHsz" clientKey:@"MHTcbB89XoSdjR5SnwcvsTxc"];
    
//    开启未读消息数通知
//    [AVIMClient setUnreadNotificationEnabled:YES];
  
    //跟踪统计应用的打开情况
    
//    [AVOSCloud setApplicationId:@"JMBPc7y4SUPRDrOSHXjXVMN7-gzGzoHsz"
//          clientKey:@"Wib2dECd48h1FzivFrH628ju"
//    serverURLString:@"https://jmbpc7y4.lc-cn-n1-shared.com"];
//    [AVOSCloud setApplicationId:@"1eUivazFXYwJvuGpPl2LE4uY-gzGzoHsz"
//             clientKey:@"nLMIaQSwIsHfF206PnOFoYYa"
//       serverURLString:@"https://1euivazf.lc-cn-n1-shared.com"];
//    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
   [AVOSCloud setApplicationId:@"2S3eFs2gbLVcDKBtXTM0e5KX-gzGzoHsz"
             clientKey:@"CY6NPCRRLpPGKLCe8372924N"
       serverURLString:@"https://ip-np10.iwxnews.com"];
    [self registerForRemoteNotification:launchOptions];
//    [AVAnalytics setChannel:@"appStore"];
    
    //    //注册微信
    //    [WXApi registerApp:@"wx99f399b5e486262c"];
    [AVOSCloud setAllLogsEnabled:YES];
    [AVPush setProductionMode:false];

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[VVTabBarController alloc]init];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    //本地清空角标
    [application setApplicationIconBadgeNumber:0];
    //currentInstallation 的角标清零
    [AVInstallation defaultInstallation].badge = 0;
    [[AVInstallation defaultInstallation] saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
         // save succeeded
        } else if (error) {
         NSLog(@"%@", error);
        }
    }];
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/**
 * 初始化UNUserNotificationCenter
 */
- (void)registerForRemoteNotification :(NSDictionary *)launchOptions{
    
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
           switch ([settings authorizationStatus]) {
               case UNAuthorizationStatusAuthorized:
                   dispatch_async(dispatch_get_main_queue(), ^{
                       [[UIApplication sharedApplication] registerForRemoteNotifications];
                   });
                   break;
               case UNAuthorizationStatusNotDetermined:
                   [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
                       if (granted) {
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [[UIApplication sharedApplication] registerForRemoteNotifications];
                           });
                       }
                   }];
                   break;
               default:
                   break;
           }
       }];
    if ([[UIDevice currentDevice].systemVersion floatValue] < 10.0) {
        NSDictionary *notificationPayload;
        @try {
            notificationPayload = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        } @catch (NSException *exception) {}

        // Create a pointer to the Photo object
//        NSString *photoId = [notificationPayload objectForKey:@"p"];
//        AVObject *targetPhoto = [AVObject objectWithoutDataWithClassName:@"Photo"
//                                                                objectId:photoId];

        // Fetch photo object
//        [targetPhoto fetchIfNeededInBackgroundWithBlock:^(AVObject *object, NSError *error) {
            // Show photo view controller
//            if (!error && [AVUser currentUser]) {
//                PhotoVC *viewController = [[PhotoVC alloc] initWithPhoto:object];
//                [self.navController pushViewController:viewController animated:YES];
//            }
//        }];
    }
//
    }

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[AVInstallation defaultInstallation] setDeviceTokenFromData:deviceToken
                                                            teamId:@"7J5XFNL99Q"];
      [[AVInstallation defaultInstallation] saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
          if (succeeded) {
              // save succeeded
          } else if (error) {
              NSLog(@"%@", error);
          }
      }];
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"注册失败，无法获取设备 ID, 具体错误: %@", error);
}
/**
 * Required for iOS10+
 * 在前台收到推送内容, 执行的方法
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSDictionary *userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //TODO:处理远程推送内容
        NSLog(@"---userInfo->%@", userInfo);
    }
    
    // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
    completionHandler(UNNotificationPresentationOptionAlert);
}

/**
 * Required for iOS10+
 * 在后台和启动之前收到推送内容, 点击推送内容后，执行的方法
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //TODO:处理远程推送内容
        NSLog(@"%@", userInfo);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"收到推送" message:@"userInfo" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"修改",nil];
        
        [alert show];
    }
    completionHandler();
}
#pragma mark -
#pragma mark - UIApplicationDelegate Method

/*!
 * Required for iOS 7+
 */
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    //TODO:处理远程推送内容
    NSLog(@"%@", userInfo);
    [self showAlertTitle:@"test" andMessage:[NSString stringWithFormat:@"%@", userInfo]];
    
    // Must be called when finished
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - 实现注册APNs失败接口（可选）
///=============================================================================
/// @name 实现注册APNs失败接口（可选）
///=============================================================================

/**
 * also used in iOS10
 */

-(void)showAlertTitle:(NSString *)title andMessage:(NSString *) message{
    
    UIAlertController * alertVc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertVc addAction:sureAction];
    [self.window.rootViewController presentViewController:alertVc animated:YES completion:nil];
    
}
#pragma mark - 微信登录 SDK


//-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//
//    return [WXApi handleOpenURL:url delegate:self];
//
//}
//
////是微信终端向第三方程序发起请求，要求第三方程序响应。第三方程序响应完后必须调用sendRsp返回。在调用sendRsp返回时，会切回到微信终端程序界面。
//- (void)onReq:(BaseReq *)req{
//}
////如果第三方程序向微信发送了sendReq的请求，那么onResp会被回调。sendReq请求调用后，会切到微信终端程序界面。
//-(void)onResp:(SendAuthResp *)resp{
//    AFHTTPSessionManager *manager = [self sessionManager];
//    NSString *url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code", @"wx99f399b5e486262c",@"c1e5e060f6331283bca17c367c1de0d4",resp.code];
//    [manager GET:url parameters:nil progress:nil
//
//         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//             NSLog(@"这里打印请求成功要做的事--->%@",responseObject);
//
//             AVUser *user = [AVUser user];
//             AVUserAuthDataLoginOption *option = [AVUserAuthDataLoginOption new];
//             option.platform = LeanCloudSocialPlatformWeiXin;
//             [user loginWithAuthData:responseObject platformId:LeanCloudSocialPlatformWeiXin options:option callback:^(BOOL succeeded, NSError * _Nullable error) {
//                 if (succeeded) {
//                     // do whatever you want.
//
//
//                 }
//             }];
//         }
//         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
//             NSLog(@"==========>%@",error);  //这里打印错误信息
//
//         }];
//
//}
//- (AFHTTPSessionManager *)sessionManager{
//
//    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
//
//    // request
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"accept"];
//
//
//    // response
//    manager.responseSerializer.acceptableContentTypes =  [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"application/json",@"text/plain",@"text/html"]];
//    manager.requestSerializer.timeoutInterval = 30;
//    return manager;
//}
////应用支持外部调用
//-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//
//    //应用内查询要用下面的代码
//    //    NSString *objectId = [url.path lastPathComponent];
//    //
//    //    AVObject *todo = [AVObject objectWithClassName:@"SearchApp"];
//    //    [todo fetchInBackgroundWithBlock:^(AVObject *object, NSError *error) {
//    //        NSString *test =[object objectForKey:@"text"];
//    //        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"标题" message:test delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
//    //        [alertview show];
//    //    }];
//    //    return YES;
//
//    return [WXApi handleOpenURL:url delegate:self];
//
//}
//
//// When Build with IOS 9 SDK
//// For application on system below ios 9
//
//// For application on system equals or larger ios 9
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
//{
////    return [AVOSCloudSNS handleOpenURL:url];
//}

@end




