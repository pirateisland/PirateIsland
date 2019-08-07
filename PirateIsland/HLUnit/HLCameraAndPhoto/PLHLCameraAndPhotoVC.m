//
//  PLHLCameraAndPhotoVC.m
//  PirateIsland
//
//  Created by hanlin on 2019/7/7.
//  Copyright © 2019 PL. All rights reserved.
//

#import "PLHLCameraAndPhotoVC.h"
#import <Photos/Photos.h>
#import "DDCardView.h"

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
    
    UIView *test = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    test.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_hanlin_normal"]];
    
    UIView *testTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    testTwo.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_yana_select"]];
    
    
    DDCardView *testCard = [[DDCardView alloc]initWithFrame:CGRectMake(300, 300, 200, 200)
                                                      front:test
                                                       back:testTwo
                                                   tapBlock:^(BOOL isBack, UIView * _Nonnull tapView) {
                                                       
                                                   }];
//    testCard.isBack = 1;
//    testCard.canNotTap = NO;
    testCard.panOrSwipeBack = NO;
    [self.view addSubview:testCard];
}
- (void)creatUI{
    UIImageView * imageView = [UIImageView new];
    self.showImageView = imageView;
    [self.view addSubview:imageView];
    imageView.backgroundColor = HLRandomColor;
    [imageView addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:nil];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    UIButton * cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:cameraBtn];
    [cameraBtn setTitle:@"相机或者相册" forState:UIControlStateNormal];
    [cameraBtn addTarget:self action:@selector(cameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showImageView.mas_bottom).offset(0);
        make.centerX.mas_equalTo(self.showImageView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"keyPath=%@---object=%@---change=%@---context%@",keyPath,object,change,context);
    
    
}
- (void)dealloc{
    [self.showImageView removeObserver:self forKeyPath:@"backgroundColor"];
}
- (void)cameraBtnClick:(UIButton*)sender{
    [self alertVC];
}
- (void)alertVC{
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"选择功能" message:@"选择相机或者相机等" preferredStyle:UIAlertControllerStyleActionSheet];
    
     self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self; //设置代理
    self.imagePickerController.allowsEditing = YES;
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            self.imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
            self.imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;


            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }else{
            [PLTool showTopMessage:@"此设备不支持相机"];
        }
       
        
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }];
    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [alertVC addAction:action3];
    
    UIPopoverPresentationController *popover = alertVC.popoverPresentationController;
    
    if (popover) {
        
        popover.permittedArrowDirections = UIPopoverArrowDirectionLeft;
        popover.sourceView = self.showImageView;
        popover.sourceRect = self.showImageView.bounds;
    }
    
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];
    //    [alertVC showViewController:self sender:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    self.showImageView.backgroundColor = HLRandomColor;
//    self.showImageView.backgroundColor = HLRandomColor;
    

    
   
 }

#pragma mark -实现图片选择器代理-（上传图片的网络请求也是在这个方法里面进行，这里我不再介绍具体怎么上传图片）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
    self.showImageView.image = image;  //给UIimageView赋值已经选择的相片
    NSString * mediaType = [info objectForKey:UIImagePickerControllerMediaType];
//    if ([mediaType isEqualToString:(NSString *)UTTypeImage] && picker.sourceType ==UIImagePickerControllerSourceTypeCamera){
//        
//    }
     UIImage * sourceImage = [info objectForKey:UIImagePickerControllerOriginalImage];
//     UIImageWriteToSavedPhotosAlbum(sourceImage,self,nil,nil);
     UIImageWriteToSavedPhotosAlbum(sourceImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

}
//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}
//保存照片成功后的回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    HLLog(@"==%@==%@===%@",error,image,contextInfo);
}
//检查是否存在某一个名字的相册
- (BOOL)isExistPhotosAlbum:(NSString *)albumName {
    //首先获取用户手动创建相册的集合
    PHFetchResult *collectonResuts = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
    __block BOOL isExisted = NO;
    //对获取到集合进行遍历
    [collectonResuts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        PHAssetCollection *assetCollection = obj;
        // albumName是自定义的要写入照片的相册
        if ([assetCollection.localizedTitle isEqualToString:albumName])  {
            isExisted = YES;
        }
    }];
    
    return isExisted;
}
//如果不存在，则创建自定义相册
- (void)createPhotosAlbum:(NSString *)albumName {
    if (![self isExistPhotosAlbum:albumName]) {
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            // 创建相册
            [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:albumName];
            
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"创建相册文件夹成功!");
            } else {
                NSLog(@"创建相册文件夹失败:%@", error);
            }
        }];
    }
}
//保存照片
- (void)saveImage:(NSString *)imagePath{
    NSURL *url = [NSURL fileURLWithPath:imagePath];
    
    // 要保存到系统相册中的图片的标识
    __block NSString *localIdentifier;
    
    // 获取相册的集合
    PHFetchResult *collectonResuts = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
    // 对获取到集合进行遍历
    [collectonResuts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        PHAssetCollection *assetCollection = obj;
        // _albumName是我们写入照片的相册
        if ([assetCollection.localizedTitle isEqualToString:@"_albumName"])  {
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                // 请求创建一个Asset
                PHAssetChangeRequest *assetRequest = [PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:url];
                // 请求编辑相册
                PHAssetCollectionChangeRequest *collectonRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
                // 为Asset创建一个占位符，放到相册编辑请求中
                PHObjectPlaceholder *placeHolder = [assetRequest placeholderForCreatedAsset];
                // 相册中添加照片
                [collectonRequest addAssets:@[placeHolder]];
                localIdentifier = placeHolder.localIdentifier;
            } completionHandler:^(BOOL success, NSError *error) {
                if (success) {
                    NSLog(@"保存图片成功!");
                } else {
                    NSLog(@"保存图片失败:%@", error);
                }
            }];
        }
    }];
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
