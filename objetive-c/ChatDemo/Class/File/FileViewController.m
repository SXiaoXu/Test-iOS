//
//  FileViewController.m
//  ChatDemo
//
//  Created by Vivian on 2017/11/3.
//  Copyright © 2017年 NineNine. All rights reserved.

#import "FileViewController.h"
#import "AVPlayerViewController.h"
@interface FileViewController ()<UIImagePickerControllerDelegate,UIActionSheetDelegate>
/** 图片选择器 */
@property (nonatomic,strong) UIImagePickerController *picker;
@property (nonatomic,strong) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *playVideoView;

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    AVObject *todo = [[AVObject alloc] initWithClassName:@"Todo"]; // 构建对象
    [todo setObject:@"马拉松报名" forKey:@"title"]; // 设置名称
    [todo setObject:@2 forKey:@"priority"]; // 设置优先级
    [todo setObject:[AVUser currentUser] forKey:@"owner"]; // 这里就是一个 Pointer 类型，指向当前登录的用户

    NSMutableDictionary *serializedJSONDictionary = [todo dictionaryForObject]; // 获取序列化后的字典
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:serializedJSONDictionary options:0 error:&err]; // 获取 JSON 数据
    NSString *serializedString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]; // 获取 JSON 字符串
    // serializedString 的内容是：{"title":"马拉松报名","className":"Todo","priority":2}
    
    [todo saveInBackground]; // 保存到云端
    
    
    
    //    AVFile *file = [AVFile fileWithRemoteURL:[NSURL URLWithString: @"http://ww3.sinaimg.cn/bmiddle/596b0666gw1ed70eavm5tg20bq06m7wi.gif"]];
//    AVObject *todo = [AVObject objectWithClassName:@"Todo"];
//    [todo setObject:file forKey:@"girl"];
//    [todo setObject:@"明星" forKey:@"topic"];
//    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//
//    }];
//      AVFile *file =[AVFile fileWithRemoteURL:[NSURL URLWithString:@"https://leancloud.cn/assets/imgs/index/server.248917ae.png"]];
//    [file uploadWithCompletionHandler:^(BOOL succeeded, NSError *error) {
//        NSLog(@"%@", file.url);//返回一个唯一的 Url 地址
//
//    }];
    
//    // 存储一个带有图片的 Todo 到 LeanCloud 云端
//    AVFile *aTodoAttachmentImage = [AVFile fileWithURL:@("http://www.zgjm.org/uploads/allimg/150812/1_150812103912_1.jpg")];
    
//    AVFile *aTodoAttachmentImage = [AVFile fileWithRemoteURL:[NSURL URLWithString:@"http://www.zgjm.org/uploads/allimg/150812/1_150812103912_1.jpg"]];
//
//    AVObject *todo = [AVObject objectWithClassName:@"Todo"];
//    [todo setObject:aTodoAttachmentImage forKey:@"images"];
//    [todo setObject:@"记得买过年回家的火车票！！！" forKey:@"content"];
//    [todo saveInBackground];
//
//    // 使用非空值查询获取有图片的 Todo
//    AVQuery *query = [AVQuery queryWithClassName:@"Todo"];
//    [query whereKeyExists:@"images"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        // objects 返回的就是有图片的 Todo 集合
//    }];
//
//    // 使用空值查询获取没有图片的 Todo
//    [query whereKeyDoesNotExist:@"images"];
    
}
-(void)testFileDownload{
         AVFile *file = [AVFile fileWithRemoteURL:[NSURL URLWithString:@"http://ww3.sinaimg.cn/bmiddle/596b0666gw1ed70eavm5tg20bq06m7wi.gif"]];
    
        [file uploadWithCompletionHandler:^(BOOL succeeded, NSError *error) {
    
    
            if (succeeded) {
                [file downloadWithProgress:^(NSInteger number) {
    
    
                } completionHandler:^(NSURL * _Nullable filePath, NSError * _Nullable error) {
                    if (error) {
                        NSLog(@"下载失败%@",error);
    
                    }else{
                        NSLog(@"下载成功%@",filePath);
                    }
                }];
            }
        }];
        AVQuery *query = [AVQuery queryWithClassName:@"Todo"];
        [query whereKey:@"topic" equalTo:@"明星"];
        [query includeKey:@"girl"];
        [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            AVObject *object = objects[0];
            AVFile *file = [object objectForKey:@"girl"];
    
            [file downloadWithProgress:^(NSInteger number) {
                //下载的进度数据，number 介于 0 和 100。
            } completionHandler:^(NSURL * _Nullable filePath, NSError * _Nullable error) {
                // filePath 是文件下载到本地的地址
            }];
        }];
}
//音频文件上传测试
-(void)mp3FileTest{
    
//    上传一个mp3格式的
        AVFile *file =[AVFile fileWithRemoteURL:@"http://ac-jmbpc7y4.clouddn.com/d40e9cf44dc5dadf1577.m4a"];
 

    
    //        [file getData];// 注意这一步很重要，这是把图片从原始地址拉去到本地
        [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                NSLog(@"上传mp3成功");
            }else{
                NSLog(@"上传mp3失败>%@",error);
            }
        }progressBlock:^(NSInteger percentDone) {
            // 上传进度数据，percentDone 介于 0 和 100。
            NSLog(@"file.url----------------->%ld",(long)percentDone);//返回一个唯一的 Url 地址
    
        }];
//    AVPlayerViewController *vc = [[AVPlayerViewController alloc]init];
//    [ self presentViewController:vc animated: YES completion:nil];
}

- (void)setAudioDataForMessage:(AVIMAudioMessage *)message
{
    
    [message.file getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        
        
    } progressBlock:^(NSInteger number) {
        
    }];
    
    [message.file downloadWithCompletionHandler:^(NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSData *data = [NSData dataWithContentsOfURL:filePath];
        if (!error && data){
        
            
        }
        
    }];
}
- (IBAction)otherTestBtn:(id)sender {

    [self mp3FileTest];
}

- (IBAction)chooseImage:(id)sender {
    [self cemororAction];
}
//上传大文件
- (IBAction)bigFile:(id)sender {
    [self bigFileUpload];
}
-(void)bigFileUpload{
    
    //2.3M:备份ChatDemo
    //19M
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"2M" ofType:@"zip"];
    NSData *zipData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
    AVFile *file = [AVFile fileWithData:zipData name:@"2M.zip"];
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (succeeded) {
            NSLog(@"上传成功");
        }else{
            NSLog(@"上传失败>%@",error);
        }
    }progressBlock:^(NSInteger percentDone) {
        // 上传进度数据，percentDone 介于 0 和 100。
        NSLog(@"file.url----------------->%ld",(long)percentDone);
    }];
}
//上传图片测试
- (void)cemororAction
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"照相机",@"图片库", nil];//UIActionSheet初始化，并设置delegate
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showFromRect:self.view.bounds inView:self.view animated:YES]; // actionSheet弹出位置
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

-(void)getImage:(UIImage *)image AndData:(NSData *)data
{
    
    AVFile *file = [AVFile fileWithData:data name:@"aaaaa.png"];
    
    
    [file uploadWithProgress:^(NSInteger number) {
        NSLog(@"number--上传进度>%ld",(long)number);

    } completionHandler:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            
            NSLog(@"上传成功");
            
            
        }else{
            NSLog(@"error--上传失败>%@",error);
            
        }
    }];
}



#pragma mark -  Public Methods
#pragma mark - UIImagePickerControllerDelegate
#pragma mark - 拍照/选择图片结束
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];//编辑后的图片
    NSData * imageData;
    if (UIImagePNGRepresentation(image)) {
        imageData = UIImagePNGRepresentation(image);
    }else{
        imageData = UIImageJPEGRepresentation(image, 1.0);
    }
    [self getImage:image AndData:imageData];
    
    [self.picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 取消拍照/选择图片
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
            case 0:
        {
            NSLog(@"打开系统照相机");
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                self.picker = [[UIImagePickerController alloc] init];
                self.picker.delegate = self;//设置UIImagePickerController的代理，同时要遵循UIImagePickerControllerDelegate，UINavigationControllerDelegate协议
                self.picker.allowsEditing = YES;//设置拍照之后图片是否可编辑，如果设置成可编辑的话会在代理方法返回的字典里面多一些键值。PS：如果在调用相机的时候允许照片可编辑，那么用户能编辑的照片的位置并不包括边角。
                self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;//UIImagePicker选择器的类型，UIImagePickerControllerSourceTypeCamera调用系统相机
                [self.view.window.rootViewController presentViewController:self.picker animated:YES completion:nil];
            }
            else{
                //如果当前设备没有摄像头
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"哎呀，当前设备没有摄像头。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
            break;
        }
            case 1:
        {
            NSLog(@"打开系统图片库");
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                self.picker = [[UIImagePickerController alloc]init];
                self.picker.delegate = self;
                self.picker.allowsEditing = YES;//是否可以对原图进行编辑
                
                //打开相册选择照片
                self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self.view.window.rootViewController presentViewController:self.picker animated:YES completion:nil];
            }
            else{
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"图片库不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
            break;
        }
            case 2:
        {
            NSLog(@"取消");
            break;
        }
        default:
            break;
    }
}
#pragma mark -  Getters and Getters

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    }
    return  _imageView;
}
@end

