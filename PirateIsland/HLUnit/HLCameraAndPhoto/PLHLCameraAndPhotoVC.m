//
//  PLHLCameraAndPhotoVC.m
//  PirateIsland
//
//  Created by hanlin on 2019/7/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLHLCameraAndPhotoVC.h"

@interface PLHLCameraAndPhotoVC ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong) UIImagePickerController *imagePickerController; //声明全局的UIImagePickerController
@property (nonatomic,strong) UIImageView * showImageView;
@end

@implementation PLHLCameraAndPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相机和相册";
    [self creatUI];
}
- (void)creatUI{
    UIImageView * imageView = [UIImageView new];
    self.showImageView = imageView;
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    
    
}
- (void)alertVC{
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"选择功能" message:@"选择相机或者相机等" preferredStyle:UIAlertControllerStyleActionSheet];
    
     self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self; //设置代理
    self.imagePickerController.allowsEditing = YES;
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }else{
            [PLTool showTopMessage:@"此设备不支持相机"];
        }
       
        
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }];
    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [alertVC addAction:action3];
    
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];
    //    [alertVC showViewController:self sender:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self alertVC];
//    NSUInteger sourceType = 0;
//    // 判断系统是否支持相机
//    self.imagePickerController = [[UIImagePickerController alloc] init];
//    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        self.imagePickerController.delegate = self; //设置代理
//        self.imagePickerController.allowsEditing = YES;
//        self.imagePickerController.sourceType = sourceType; //图片来源
//        if (buttonIndex == 0) {
//            return;
//        }else if (buttonIndex == 1) {
//            //拍照
//            sourceType = UIImagePickerControllerSourceTypeCamera;
//            self.imagePickerController.sourceType = sourceType;
//            [self presentViewController:self.imagePickerController animated:YES completion:nil];
//        }else if (buttonIndex == 2){
//            //相册
//            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            self.imagePickerController.sourceType = sourceType;
//            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }

#pragma mark -实现图片选择器代理-（上传图片的网络请求也是在这个方法里面进行，这里我不再介绍具体怎么上传图片）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
    self.showImageView.image = image;  //给UIimageView赋值已经选择的相片
    
    
    //上传图片到服务器--在这里进行图片上传的网络请求，这里不再介绍
//    ......
}
//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
