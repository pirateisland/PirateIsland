//
//  PLHLCameraAndPhotoVC.m
//  PirateIsland
//
//  Created by hanlin on 2019/7/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLHLCameraAndPhotoVC.h"

@interface PLHLCameraAndPhotoVC ()<UIImagePickerControllerDelegate>
@property(nonatomic,strong) UIImagePickerController *imagePickerController; //声明全局的UIImagePickerController
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
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSUInteger sourceType = 0;
    // 判断系统是否支持相机
    self.imagePickerController = [[UIImagePickerController alloc] init];
//    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        self.imagePickerController.delegate = self; //设置代理
//        self.imagePickerController.allowsEditing = YES;
//        self.imagePickerController.sourceType = sourceType; //图片来源
//        if (buttonIndex == 0) {
//            return;
//        }else if (buttonIndex == 1) {
            //拍照
            sourceType = UIImagePickerControllerSourceTypeCamera;
            self.imagePickerController.sourceType = sourceType;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
//        }else if (buttonIndex == 2){
//            //相册
//            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            self.imagePickerController.sourceType = sourceType;
//            [self presentViewController:self.imagePickerController animated:YES completion:nil];
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
