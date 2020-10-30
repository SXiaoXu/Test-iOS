//
//  AVPlayerViewController.m
//  ChatDemo
//
//  Created by XiaoXu on 2017/12/20.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "AVPlayerViewController.h"

@interface AVPlayerViewController ()
@property (nonatomic,strong) AVPlayer *player;

@end

@implementation AVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.player  play];
}
//延时加载
- (AVPlayer *)player
{
    if (_player == nil) {
        // 1.获取URL(远程/本地)
        // NSURL *url = [[NSBundle mainBundle] URLForResource:@"01-知识回顾.mp4" withExtension:nil];
        NSURL *url = [NSURL URLWithString:@"https://dn-nyrqoa01.qbox.me/ENxo7ILet4TRJTaKCOttMcD"];
        
        // 2.创建AVPlayerItem
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        
        // 3.创建AVPlayer
        _player = [AVPlayer playerWithPlayerItem:item];
        
        // 4.添加AVPlayerLayer
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16);
        [self.view.layer addSublayer:layer];
    }
    return _player;
}
@end
