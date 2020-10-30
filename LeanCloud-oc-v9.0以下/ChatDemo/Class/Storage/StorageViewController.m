//
//  StorageViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/20.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "StorageViewController.h"
#import <AVOSCloudLiveQuery/AVOSCloudLiveQuery.h>
@interface StorageViewController ()<AVLiveQueryDelegate>
@property (nonatomic, strong) AVLiveQuery *doingLiveQuery;
@property (nonatomic, strong) AVIMClient *client;
@end

@implementation StorageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //地理位置查询
    //[self queryLocation];
    //查询 Relation 关系
    // [self queryRelation];
    //LiveQuery测试
    [self testLiveQuery];
    //[self queryArray];
//    [self testLiveQuery];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self updateDate];
    [AVUser logOut];
    
}
//AVInstallation
- (void)testAVInstallation{
    //    AVQuery *query = [AVInstallation query];
    //    [query whereKey:@"channels" containedIn:@[@"sui"]];
    //    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    //        if (error == nil)
    //        {
    //            NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:0];
    //            for (AVInstallation *installation in objects)
    //            {
    //                [installation removeObjectsInArray:@[@"sui"] forKey:@"channels"];
    //                [tempArray addObject:installation];
    //            }
    //            if (tempArray.count > 0)
    //            {
    //                [AVObject saveAllInBackground:tempArray block:^(BOOL succeeded, NSError *error) {
    //
    //                }];
    //            }
    //        }
    //    }];
}
//数据更新
- (void)updateDate{
    AVQuery *query = [AVQuery queryWithClassName:@"Todo"];
    query.includeACL = true;
    [query whereKey:@"objectId" equalTo:@"5ad06a679f54540045a76b68"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        AVObject *obj = [objects firstObject];
        NSLog(@"obj.ACL:%@",obj.ACL);
        
//        [obj setObject:@10 forKey:@"price"];
//        [obj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//            if (succeeded) {
//
//            }else{
//
//
//            }
//        }];
        
        
    }];
}
//数组查询
- (void)queryArray{
    
    AVQuery *query = [AVQuery queryWithClassName:@"Staff"];
    [query includeKey:@"ower"];
    [query whereKey:@"ower" equalTo:[AVUser currentUser]];
    [query getFirstObjectInBackgroundWithBlock:^(AVObject *object, NSError *error) {
        // object 就是符合条件的第一个 AVObject
    }];
}
- (void)queryRelation{
    AVObject *todoFolder = [AVObject objectWithClassName:@"TestObject" objectId:@"59f2a66067f35600445759c5"];
    
    AVRelation *relation = [todoFolder relationForKey:@"testRelation"];
    AVQuery *query = [relation query];
    [query whereKey:@"testBool" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"---->%@",objects);
    }];
}
//地理位置查询
-(void)queryLocation{
    AVQuery *query = [AVQuery queryWithClassName:@"Todo"];
    AVGeoPoint *point = [AVGeoPoint geoPointWithLatitude:39.9 longitude:116.4];
    [query whereKey:@"whereCreated"  nearGeoPoint:point withinKilometers:2.0];
    
    query.limit = 10;
    [query whereKey:@"whereCreated" nearGeoPoint:point];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSArray<AVObject *> *nearbyTodos = objects;// 离这个位置最近的 10 个 Todo 对象
    }];
}
- (IBAction)liveQueryAdd:(id)sender {
    AVObject *todo = [AVObject objectWithClassName:@"Todo"];
    todo[@"state"] = @"doing";
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        /* Saved. */
        if (succeeded) {
            
        }
    }];
}
- (IBAction)liveQueryUpdate:(id)sender {
    
    AVObject *todo = [AVObject objectWithClassName:@"Todo" objectId:@"5aa1f181ac502e003ed3a2b9"];
    todo[@"title"] = @"更新林";
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {

    }];
}

- (void)testLiveQuery
{
    AVQuery *doingQuery = [AVQuery queryWithClassName:@"Todo"];
    AVQuery *doneQuery  = [AVQuery queryWithClassName:@"Todo"];
    [doingQuery whereKey:@"state" equalTo:@"doing"];
    [doneQuery  whereKey:@"state" equalTo:@"done"];
    [doingQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        /* Doing list did fetch. */
    }];
    [doneQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        /* Doing list did fetch. */
    }];
    
    self.doingLiveQuery = [[AVLiveQuery alloc] initWithQuery:doingQuery];
    self.doingLiveQuery.delegate = self;
    [self.doingLiveQuery subscribeWithCallback:^(BOOL succeeded, NSError * _Nonnull error) {
        /* Subscribed. */
        
        
    }];
}

#pragma mark - LiveQuery delegate methods
-(void)liveQuery:(AVLiveQuery *)liveQuery userDidLogin:(AVUser *)user{
    
}

- (void)liveQuery:(AVLiveQuery *)liveQuery objectDidCreate:(id)object {
    
    
    NSLog(@"触发成功");
    if (liveQuery == self.doingLiveQuery) {
        /* A new doing task did create. */
        
    }
}
- (void)liveQuery:(AVLiveQuery *)liveQuery objectDidUpdate:(id)object updatedKeys:(NSArray<NSString *> *)updatedKeys {
    
    for (NSString *key in updatedKeys) {
        NSLog(@"%@: %@", key, object[key]);
        
    }
}
@end

