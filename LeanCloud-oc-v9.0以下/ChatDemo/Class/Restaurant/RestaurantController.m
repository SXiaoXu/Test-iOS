//
//  RestaurantController.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/21.
//  Copyright © 2017年 NineNine. All rights reserved.
//
#import "RestaurantController.h"
@interface RestaurantController ()<AVIMClientDelegate>
@property (nonatomic, strong) AVIMClient *client;

@end

@implementation RestaurantController
#define kConversationId @"59e452f97565710046a36343"
#pragma mark -  Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //5af90eaca22b9d004482605a
    //5790a6f82e958a0065ebbd50
    AVGeoPoint *point = [AVGeoPoint geoPointWithLatitude:39.9 longitude:116.4];
    
    
    AVQuery *query = [AVQuery queryWithClassName:@"_File"];
     [query getObjectInBackgroundWithId:@"5790a6f82e958a0065ebbd50" block:^(AVObject *object, NSError *error) {
        
         AVFile *file = [AVFile fileWithAVObject:object];
        
        [file getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
            if (error) {
                NSLog(@"下载失败--%@",error);
                
            }else{
                NSLog(@"下载成功--");
            }
        } progressBlock:^(NSInteger percentDone) {
            NSLog(@"下载进度--%ld",(long)percentDone);
        }];

        
    }];
}
#pragma mark -  UITableViewDelegate
#pragma mark -  CustomDelegate
#pragma mark -  Event Response
#pragma mark -  Notification Motheds
#pragma mark -  Button Callbacks
#pragma mark -  GestureRecognizer
#pragma mark -  Private Methods
     
     
     
     
     @end
     

