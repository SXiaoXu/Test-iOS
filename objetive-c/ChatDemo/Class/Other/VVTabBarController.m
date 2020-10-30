//
//  VVTabBarController.m
//  百思练习
//
//  Created by Vivian on 16/6/3.
//  Copyright © 2016年 Vivian. All rights reserved.
//

#import "VVTabBarController.h"
#import "VVNavigationController.h"

#import "HomeViewController.h"

#import "PostMessageViewController.h"
#import "GroupMessageViewController.h"
#import "LoginViewController.h"

@interface VVTabBarController ()

@end

@implementation VVTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    
    /**** 添加子控制器 ****/
    [self setupChildViewControllers];
    
    /**** 更换TabBar ****/
    //[self setupTabBar];
    
    
}
- (void)setupOneChildController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
    {
    
    vc.tabBarItem.title = title;

    //如果没有传图片值,判断一下
    if(image.length){
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self  addChildViewController:vc];

}

-(void)setupItemTitleTextAttributes{
    
    //UITabBarItem文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    //文字正常
    NSMutableDictionary *normaAttrs = [NSMutableDictionary dictionary];
    normaAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normaAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes: normaAttrs forState:UIControlStateNormal];
    
    //文字选中
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes: selectedAttrs forState:UIControlStateSelected];

}
-(void)setupChildViewControllers{
    
   [self setupOneChildController:[[VVNavigationController alloc]initWithRootViewController:[[HomeViewController alloc] init]]title:@"示例" image:nil
                  selectedImage:nil];
//    [self setupOneChildController:[[VVNavigationController alloc]initWithRootViewController:[[WeixinLoginViewController alloc] init] ]title:@"群聊" image:nil
//                    selectedImage:nil];
//
    [self setupOneChildController:[[VVNavigationController alloc]initWithRootViewController:[[LoginViewController alloc] init]]title:@"登录" image:nil
                        selectedImage:nil];
    
}

///**
// *  更换TabBar
// */
//- (void)setupTabBar
//{
//    [self setValue:[[VVTabbar alloc] init] forKeyPath:@"tabBar"];
//}


@end
