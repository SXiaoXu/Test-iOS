//
//  UIImageMessageViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/9/15.
//  Copyright © 2017年 NineNine. All rights reserved.
//

#import "UIImageMessageViewController.h"

#define kXiaoXuImagePath ([NSString stringWithFormat:@"%@/cathImage.jpg",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]])

@interface UIImageMessageViewController ()<AVIMClientDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) AVIMClient *client;
@property (nonatomic, strong) AVIMClient *clientJerry;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, strong) UIImage *image;

@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@property (weak, nonatomic) IBOutlet UILabel *positionLabel;

@end

@implementation UIImageMessageViewController
#pragma mark -  Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Tom 创建了一个 client，用自己的名字作为 clientId
    self.client = [[AVIMClient alloc] initWithClientId:@"Tom"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self jerryReceiveImageMessageFromTom];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.showImageView.image = nil;
    
    self.positionLabel.text =@"";
}

#pragma mark -- <UIImagePickerControllerDelegate>--
// 获取图片后的操作
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //dismiss
    [picker dismissViewControllerAnimated:YES completion:nil];
    //取出选中的图片
    // self.showImageView.image = info[UIImagePickerControllerOriginalImage];
    self.imagePath =  info[UIImagePickerControllerReferenceURL];
    self.image =info[UIImagePickerControllerOriginalImage];
    
    
    NSData *dataimge=  UIImageJPEGRepresentation(info[UIImagePickerControllerOriginalImage], 0.1);
    
    [dataimge writeToFile:kXiaoXuImagePath atomically:YES];
    
    
}

#pragma mark - AVIMClientDelegate
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    
    switch (message.mediaType) {
        case kAVIMMessageMediaTypeImage:
        {
            //图像
            AVIMImageMessage *imageMessage = (AVIMImageMessage *)message;
            //    // 消息的 id
            //    NSString *messageId = imageMessage.messageId;
            //    // 图像文件的 URL
            //    NSString *imageUrl = imageMessage.file.url;
            //    // 发该消息的 ClientId
            //    NSString *fromClientId = message.clientId;
            //
            NSLog(@"imageMessage.text-->%@",imageMessage.text) ;
            NSLog(@"file.url-->%@",imageMessage.file.url) ;

            [self.showImageView sd_setImageWithURL:[NSURL URLWithString:imageMessage.file.url]];
            //获取url
            //self.showImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageMessage.file.url]]];
            
            
            //    self.showImageView.image = [UIImage imageWithContentsOfFile:imageMessage.file.url];
            
        }
            break;
        case -5:
        {
            //位置
            
            AVIMLocationMessage *lo =  (AVIMLocationMessage *)message;
            
            self.positionLabel.text =[NSString stringWithFormat:@"%@:纬度-%f,经度-%f",lo.text,lo.latitude,lo.longitude] ;
            
        }
            break;
            
    }
    
}

#pragma mark -  Event Response
#pragma mark -  Notification Motheds
#pragma mark -  Button Callbacks
- (IBAction)postPosition:(id)sender {
    
    [self tomSendLocationToJerry];
}
//发送相册选择的图片

- (IBAction)postSelectedImage:(id)sender{
    
    [self postImageData];
}

- (IBAction)selectedImageClick:(id)sender {
    [self getImageFromIpc];
}
//发送带URL的图片
- (IBAction)postImage:(id)sender {
    
    [self postImageViewURL];
    
}

#pragma mark -  GestureRecognizer
#pragma mark -  Private Methods
#pragma mark -  Public Methods
#pragma mark -  Getters and Getters
-(void)postImageData{
    // Tom 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 建立了与 Jerry 的会话
        [self.client createConversationWithName:@"猫和老鼠" clientIds:@[@"Ros"] callback:^(AVIMConversation *conversation, NSError *error) {
            // Tom 创建了一个图像消息
            
            NSString *filePath = kXiaoXuImagePath;
            NSDictionary *attributes = @{ @"location": @"旧金山" };
            AVIMImageMessage *message = [AVIMImageMessage messageWithText:@"发自我的 iPhone" attachedFilePath:filePath attributes:attributes];
            
            // Tom 将图像消息发给 Jerry
            [conversation sendMessage:message callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");
                }
                else{
                    NSLog(@"error------->%@",error);
                }
            }];
        }];
    }];
    
}

-(void)postImageViewURL{
    
    // Tom 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // Tom 建立了与 Jerry 的会话
        [self.client createConversationWithName:@"猫和老鼠" clientIds:@[@"Ros"] callback:^(AVIMConversation *conversation, NSError *error) {
            // Tom 创建了一个图像消息
            AVFile *file = [AVFile fileWithRemoteURL:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"];
            // NSDictionary *attributes = @{ @"location": @"旧金山" };
            AVIMImageMessage *message = [AVIMImageMessage messageWithText:@"萌妹子一枚" file:file attributes:nil];
            
            // Tom 将图像消息发给 Jerry
            [conversation sendMessage:message callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");
                    
                }
                else{
                    NSLog(@"error------->%@",error);
                }
            }];
        }];
    }];
    
}


- (void)tomSendLocationToJerry {
    
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        [self.client createConversationWithName:@"猫和老鼠" clientIds:@[@"Ros"] callback:^(AVIMConversation *conversation, NSError *error) {
            // Tom 发了一个地理位置给 Jerry
            // NOTE: 开发者更可以通过具体的设备的 API 去获取设备的地理位置
            AVIMLocationMessage *message = [AVIMLocationMessage messageWithText:@"我发起地理位置" latitude:45.0 longitude:34.0 attributes:nil];
            [conversation sendMessage:message callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");
                }
            }];
        }];
    }];
}

- (void)getImageFromIpc
{
    // 1.判断相册是否可以打开
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    // 2. 创建图片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    /**
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
     UIImagePickerControllerSourceTypePhotoLibrary, // 相册
     UIImagePickerControllerSourceTypeCamera, // 用相机拍摄获取
     UIImagePickerControllerSourceTypeSavedPhotosAlbum // 相簿
     }
     */
    // 3. 设置打开照片相册类型(显示所有相簿)
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 照相机
    // ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 4.设置代理
    ipc.delegate = self;
    // 5.modal出这个控制器
    [self presentViewController:ipc animated:YES completion:nil];
}

- (void)jerryReceiveImageMessageFromTom {
    // Jerry 创建了一个 client，用自己的名字作为 clientId
    self.clientJerry = [[AVIMClient alloc] initWithClientId:@"Ros"];
    self.clientJerry.delegate = self;
    
    // Jerry 打开 client
    [self.clientJerry openWithCallback:^(BOOL succeeded, NSError *error) {
        // ...
    }];
    
}

@end
