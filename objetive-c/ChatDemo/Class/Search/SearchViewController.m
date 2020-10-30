//
//  SearchViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/11/29.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];



}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    AVSearchQuery *searchQuery = [AVSearchQuery searchWithQueryString:@"工程师"];
    searchQuery.className = @"Todo";
//    searchQuery.highlights = @"field1,field2";
    searchQuery.limit = 100;
    [searchQuery orderByAscending:@"order"];

//    searchQuery.cachePolicy = kAVCachePolicyCacheElseNetwork;
//    searchQuery.maxCacheAge = 60;
//    searchQuery.fields = @[@"field1", @"field2"];
    [searchQuery findInBackground:^(NSArray *objects, NSError *error) {
        
        for (AVObject *object in objects) {
            NSString *content = [object objectForKey:@"content"];
           
            NSLog(@"--->%@",content);
            
        }
    }];
}


@end
