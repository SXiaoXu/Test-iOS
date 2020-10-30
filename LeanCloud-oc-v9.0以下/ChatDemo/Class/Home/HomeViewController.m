//
//  HomeViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/15.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "HomeViewController.h"
#import "PostMessageViewController.h"
#import "GroupMessageViewController.h"
#import "StorageViewController.h"
#import "WebViewController.h"
//#import <LeanCloudFeedback/LeanCloudFeedback.h>
#import "RestaurantController.h"
#import "FollowViewController.h"
#import "HttpsViewController.h"
#import "ShortMessageController.h"
#import "ThirdPartyViewController.h"
#import "TestControllerViewController.h"
#import "SendMessageController.h"
#import "ReceiveMessageController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *controllerArray;
@property (nonatomic, strong) PostMessageViewController *singleVc;
@property (nonatomic, strong) GroupMessageViewController *groupVC;
@property (nonatomic,strong) StorageViewController *storeVc;
@property (nonatomic, strong) WebViewController *webVc;
@property (nonatomic, strong) RestaurantController *restVc;
@property (nonatomic, strong) FollowViewController *followVc;
@property (nonatomic, strong) HttpsViewController *httpVc;
@property (nonatomic, strong) ShortMessageController *messageVc;
@property (nonatomic, strong) ThirdPartyViewController *ThirdPattyVc;
@property (nonatomic, strong) TestControllerViewController *testVc;
@property (nonatomic, strong) SendMessageController *sendMsgVc;
@property (nonatomic, strong) ReceiveMessageController *ReceiveMsgVc;


@end

@implementation HomeViewController
#pragma mark -  Life Cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AVAnalytics beginLogPageView:@"Home"];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [AVAnalytics endLogPageView:@"Home"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.listArray = [@[@"单聊",@"群聊",@"存储",@"webView",@"用户反馈",@"餐厅系统",@"社交",@"网络请求",@"测试短信",@"第三方登录分享",@"测试",@"发消息",@"收消息"] mutableCopy];
    self.controllerArray =[@[self.singleVc,self.groupVC,self.storeVc,self.webVc,self.restVc,self.restVc,self.followVc,self.httpVc,self.messageVc,self.ThirdPattyVc,self.testVc,self.sendMsgVc,self.ReceiveMsgVc] mutableCopy];
}
#pragma mark -  UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"HomeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    cell.textLabel.text = self.listArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.row==5) {
//        LCUserFeedbackAgent *agent = [LCUserFeedbackAgent sharedInstance];
//        /* title 传 nil 表示将第一条消息作为反馈的标题。 contact 也可以传入 nil，由用户来填写联系方式。*/
//        [agent showConversations:self title:@"测试" contact:@"xsui@leancloud.cn"];

     
    }else{
      [self.navigationController pushViewController:self.controllerArray[indexPath.row] animated:YES];
    }
  

}

#pragma mark -  CustomDelegate
#pragma mark -  Event Response
#pragma mark -  Notification Motheds
#pragma mark -  Button Callbacks
#pragma mark -  GestureRecognizer
#pragma mark -  Private Methods
#pragma mark -  Public Methods
#pragma mark -  Getters and Getters

-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
        
    }
    return _listArray;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,[[UIScreen mainScreen]bounds].size.width , [[UIScreen mainScreen] bounds].size.height-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.backgroundColor =[UIColor grayColor];
        
    }
    return _tableView;
}
-(NSMutableArray *)controllerArray{
    if (!_controllerArray) {
        _controllerArray = [NSMutableArray array];
        }
    return _controllerArray;
}
-(PostMessageViewController *)singleVc{
    if (!_singleVc) {
        _singleVc = [[PostMessageViewController alloc]initWithNibName:@"PostMessageViewController" bundle:nil];
    }
    return _singleVc ;
}


-(GroupMessageViewController *)groupVC{
    if (!_groupVC) {
        _groupVC = [[GroupMessageViewController alloc]initWithNibName:@"GroupMessageViewController" bundle:nil];
        
    }
    return _groupVC;
    
}
-(StorageViewController *)storeVc{

    if (!_storeVc) {
        _storeVc = [[StorageViewController alloc]init];
        
    }
    return _storeVc;
}

-(WebViewController *)webVc{

    if (!_webVc) {
        _webVc = [[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
        
    }
    return _webVc;
}
- (RestaurantController *)restVc{
    if (!_restVc) {
        _restVc = [[RestaurantController alloc]init];
    }
    return _restVc;
}
-(FollowViewController *)followVc{
    if (!_followVc) {
        
        
        _followVc = [[FollowViewController alloc]init];
        
    }
    return _followVc;
}

-(HttpsViewController *)httpVc{
    if (!_httpVc) {
        _httpVc = [[HttpsViewController alloc]init];
    }
    return _httpVc;
}
-(ShortMessageController *)messageVc{
    
    if (!_messageVc) {
        _messageVc = [[ShortMessageController alloc]init];
    }
    return _messageVc;
}
-(ThirdPartyViewController *)ThirdPattyVc{
    if(!_ThirdPattyVc){
        _ThirdPattyVc = [[ThirdPartyViewController alloc]initWithNibName:@"ThirdPartyViewController" bundle:nil];
        
    }
    return _ThirdPattyVc;
    
}
-(TestControllerViewController *)testVc{
    
    if (!_testVc) {
        _testVc = [[TestControllerViewController alloc]initWithNibName:@"TestControllerViewController" bundle:nil];
            }
    return _testVc;
}
-(SendMessageController *)sendMsgVc{
    if (!_sendMsgVc) {
        _sendMsgVc =[[SendMessageController alloc]initWithNibName:@"SendMessageController" bundle:nil];
    }
    return _sendMsgVc;
}
-(ReceiveMessageController *)ReceiveMsgVc{
    if (!_ReceiveMsgVc) {
        _ReceiveMsgVc =[[ReceiveMessageController alloc]initWithNibName:@"ReceiveMessageController" bundle:nil];
    }
    return _ReceiveMsgVc;
}
@end
