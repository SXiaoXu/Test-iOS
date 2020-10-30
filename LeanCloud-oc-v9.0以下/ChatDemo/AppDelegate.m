//
//  AppDelegate.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/14.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "AppDelegate.h"
#import "VVTabBarController.h"
#import <UserNotifications/UserNotifications.h>
@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    华东节点 error
//  [AVOSCloud setApplicationId:@"uwWkfssEBRtrxVpQWEnFtqfr-9Nh9j0Va" clientKey:@"9OaLpoW21lIQtRYzJya4WHUR"];
//   //  华北
    [AVOSCloud setApplicationId:@"JMBPc7y4SUPRDrOSHXjXVMN7-gzGzoHsz" clientKey:@"Wib2dECd48h1FzivFrH628ju"];
////    //   新东方测试
    
    
//    [AVOSCloud setApplicationId:@"lr1n10n8163owj7ty73p1pj3qmyrlqh8grs8e7jd95kj7jka" clientKey:@"5tboxg06d9on14zwdk7ozdoupj6y8jpaz7ec6z7y322d0qcb"];

    //云引擎
//    [AVOSCloud setApplicationId:@"tiy1PsmEtJJ1QtHvHzVQLVod-gzGzoHsz" clientKey:@"m6HkmlWP3tclhnbbeWurifNl"];
 
    //第三方登录
   // [AVOSCloudSNS setupPlatform:AVOSCloudSNSSinaWeibo withAppKey:@"729980516" andAppSecret:@"8798ea76d8b528188d6d89d995da0f18" andRedirectURI:@""];
    //开启未读消息数通知
    [AVIMClient setUnreadNotificationEnabled:YES];
    //开启调试日志
    [AVOSCloud setAllLogsEnabled:YES]; 
//    //跟踪统计应用的打开情况
//    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
//    [self registerForRemoteNotification];
//    [AVAnalytics setChannel:@"appStore"];
//
//    [self performSelector:@selector(crash) withObject:nil afterDelay:5.0];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[VVTabBarController alloc]init];
    [self.window makeKeyAndVisible];

//    [AVUser logInWithUsernameInBackground:@"小丸子" password:@"987" block:^(AVUser *user, NSError *error) {
//        if (error) {
//            NSLog(@"---登录失败");
//        }else{
//            NSLog(@"---登录成功-->%@",user.sessionToken);
//
//        }
//    }];
//
    return YES;
}
- (void)crash {
  //  [NSException raise:NSGenericException format:@"模拟一条崩溃信息。"];
  //  [NSException raise:NSRangeException format:@"测试一条崩溃信息。"];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/**
 * 初始化UNUserNotificationCenter
 */
//- (void)registerForRemoteNotification {
//    // iOS10 兼容
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
//        // 使用 UNUserNotificationCenter 来管理通知
//        UNUserNotificationCenter *uncenter = [UNUserNotificationCenter currentNotificationCenter];
//        // 监听回调事件
//        [uncenter setDelegate:self];
//        //iOS10 使用以下方法注册，才能得到授权
//        [uncenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert+UNAuthorizationOptionBadge+UNAuthorizationOptionSound)
//                                completionHandler:^(BOOL granted, NSError * _Nullable error) {
//                                    [[UIApplication sharedApplication] registerForRemoteNotifications];
//                                    //TODO:授权状态改变
//                                    NSLog(@"%@" , granted ? @"授权成功" : @"授权失败");
//                                }];
//        // 获取当前的通知授权状态, UNNotificationSettings
//        [uncenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
//            NSLog(@"%s\nline:%@\n-----\n%@\n\n", __func__, @(__LINE__), settings);
//            /*
//             UNAuthorizationStatusNotDetermined : 没有做出选择
//             UNAuthorizationStatusDenied : 用户未授权
//             UNAuthorizationStatusAuthorized ：用户已授权
//             */
//            if (settings.authorizationStatus == UNAuthorizationStatusNotDetermined) {
//                NSLog(@"未选择");
//            } else if (settings.authorizationStatus == UNAuthorizationStatusDenied) {
//                NSLog(@"未授权");
//            } else if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
//                NSLog(@"已授权");
//            }
//        }];
//    }
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
//        UIUserNotificationType types = UIUserNotificationTypeAlert |
//        UIUserNotificationTypeBadge |
//        UIUserNotificationTypeSound;
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
//        
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
//    } else {
//        UIRemoteNotificationType types = UIRemoteNotificationTypeBadge |
//        UIRemoteNotificationTypeAlert |
//        UIRemoteNotificationTypeSound;
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
//    }
//#pragma clang diagnostic pop
//}
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//    if (application.applicationState == UIApplicationStateActive) {
//        // 转换成一个本地通知，显示到通知栏，你也可以直接显示出一个 alertView，只是那样稍显 aggressive：）
//        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//        localNotification.userInfo = userInfo;
//        localNotification.soundName = UILocalNotificationDefaultSoundName;
//        localNotification.alertBody = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
//        localNotification.fireDate = [NSDate date];
//        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    } else {
//        [AVAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
//    }
//}
////应用支持外部调用
//-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    
////应用内查询要用下面的代码
//    
//    NSString *objectId = [url.path lastPathComponent];
//
//    AVObject *todo = [AVObject objectWithClassName:@"SearchApp"];
//    [todo fetchInBackgroundWithBlock:^(AVObject *object, NSError *error) {
//        NSString *test =[object objectForKey:@"text"];
//        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"标题" message:test delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
//        [alertview show];
//    }];
//    return YES;
////
//    //第三方登录
//    //return [AVOSCloudSNS handleOpenURL:url];
//
//}
//- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    AVInstallation *currentInstallation = [AVInstallation currentInstallation];
//    [currentInstallation setDeviceTokenFromData:deviceToken];
//    [currentInstallation saveInBackground];
//   // [AVOSCloud handleRemoteNotificationsWithDeviceToken:deviceToken];
//
//}
//- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//    NSLog(@"注册失败，无法获取设备 ID, 具体错误: %@", error);
//}
//
//
//#pragma mark - 第三方登录
//
//-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//    return [AVOSCloudSNS handleOpenURL:url];
//}
//
//// When Build with IOS 9 SDK
//// For application on system below ios 9
//
//// For application on system equals or larger ios 9
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
//{
//    return [AVOSCloudSNS handleOpenURL:url];
//}

@end
