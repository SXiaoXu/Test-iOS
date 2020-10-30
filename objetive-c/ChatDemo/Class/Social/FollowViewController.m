//
//  FollowViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/11/2.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "FollowViewController.h"

@interface FollowViewController ()

@end

@implementation FollowViewController

//用户 xsui
#define UserObjectId  @"5cbd68b0a91c930069dabdf2"


- (void)viewDidLoad {
    [super viewDidLoad];
            [AVUser logInWithUsernameInBackground:@"123" password:@"987" block:^(AVUser *user, NSError *error) {
                if (error) {
                    NSLog(@"登录失败 %@", error);
                } else {
                    NSLog(@"登录成功");
    
                    AVStatus *status=[[AVStatus alloc] init];
                    status.data=@{@"text":@"我还没关注别人"};
                    [AVStatus sendStatusToFollowers:status andCallback:^(BOOL succeeded, NSError *error) {
                        NSLog(@"============ Send %@", [status debugDescription]);
                    }];
            }
    }];
    
    //                AVStatus *status=[[AVStatus alloc] init];
    //                    status.data=@{@"text":@"111第一次关注别人"};
    //                    [AVStatus sendStatusToFollowers:status andCallback:^(BOOL succeeded, NSError *error) {
    //                        NSLog(@"============ Send %@", [status debugDescription]);
    //                    }];
    //
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)AfollowBBtn:(id)sender {
    
    //关注
    [[AVUser currentUser] follow:UserObjectId andCallback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            AVStatus *status=[[AVStatus alloc] init];
            status.data=@{@"text":@"我关注一个人"};
            [AVStatus sendStatusToFollowers:status andCallback:^(BOOL succeeded, NSError *error) {
                NSLog(@"============ Send %@", [status debugDescription]);
            }];
        }
    }];
    
}
- (IBAction)AUnFollowBBtn:(id)sender {
    
    //取消关注
    [[AVUser currentUser] unfollow:UserObjectId andCallback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            AVStatus *status=[[AVStatus alloc] init];
            status.data=@{@"text":@"我取消关注别人"};
            [AVStatus sendStatusToFollowers:status andCallback:^(BOOL succeeded, NSError *error) {
                NSLog(@"============ Send %@", [status debugDescription]);
            }];
        }
    }];
    
    
    
}
- (IBAction)AfollowBAgain:(id)sender {
    
    
    //关注
    [[AVUser currentUser] follow:UserObjectId andCallback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            AVStatus *status=[[AVStatus alloc] init];
            status.data=@{@"text":@"我再次关注别人"};
            [AVStatus sendStatusToFollowers:status andCallback:^(BOOL succeeded, NSError *error) {
                NSLog(@"============ Send %@", [status debugDescription]);
            }];
        }
    }];
    
}

- (IBAction)getStatusBtn:(id)sender {
        AVStatusQuery *query=[AVStatus inboxQuery:kAVStatusTypeTimeline];
    
        //限制50条
        query.limit=50;
    
        //限制 1397 这个 messageId 上次查询的最大 messageId，如果不设置，默认为最新的
        query.maxId=1397;
    
        //需要同时附带发送者的数据
        [query includeKey:@"source"];
    
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            //获得 AVStatus 数组
    
            NSLog(@"--->%@",objects);
    
        }];
}

- (IBAction)queryStatus:(id)sender {
        AVQuery *query=[AVQuery  queryWithClassName:@"_Status"];
        [query includeKey:@"source"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    
            NSLog(@"--->%@",objects);
    
        }];
}

@end

