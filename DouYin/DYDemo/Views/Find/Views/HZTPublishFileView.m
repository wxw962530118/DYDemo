//
//  HZTPublishFileView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTPublishFileView.h"
#import "HZTFindFileView.h"
@interface HZTPublishFileView ()<TZImagePickerControllerDelegate>
/**  */
@property (nonatomic,strong) NSMutableArray * viewsArr;
/**  */
@property (nonatomic,strong) NSMutableArray * chooseFileArr;

@end

@implementation HZTPublishFileView

-(HZTFilesModel *)addModel{
    HZTFilesModel * model = [HZTFilesModel new];
    model.isAdd = YES;
    return model;
}
-(void)updateContentFiles:(NSArray *)files{
    int oneLineCnt = 3;
    int cnt = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat wh = (kScreenWidth-2*15-(oneLineCnt-1)*15)/oneLineCnt;
    NSMutableArray * tempArr = [NSMutableArray arrayWithArray:files];
    [tempArr addObject:self.addModel];
    for (int i =0; i<tempArr.count; i++) {
        HZTFilesModel * item = tempArr[i];
        x = (i % oneLineCnt)*wh + (i % oneLineCnt + 1) * 15;
        y = (i / oneLineCnt)*wh + (i / oneLineCnt) * 15;
        if (i>=self.viewsArr.count) {
            __weak typeof(self) weakSelf = self;
            HZTFindFileView * view = [[HZTFindFileView alloc] initWithFrame:CGRectMake(x, y, wh, wh)];
            [view setClickTheView:^(HZTFilesModel * _Nonnull item) {
                [weakSelf clickView:item];
            }];
            [self.viewsArr addObject:view];
            [self addSubview:view];
        }
        cnt++;
        HZTFindFileView * view = self.viewsArr[i];
        view.model = item;
        view.hidden = NO;
        if(i==tempArr.count-1) if(self.updateHBlcok) self.updateHBlcok(CGRectGetMaxY(view.frame));
    }
    for (int i =cnt; i<self.viewsArr.count; i++) {
        HZTFindFileView * view = self.viewsArr[i];
        view.hidden = YES;
    }
}

-(void)clickView:(HZTFilesModel *)model{
    if (model.isAdd) {
        TZImagePickerController * picker = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
        picker.allowPickingVideo = NO;
        picker.allowPickingImage = YES;
        picker.allowTakePicture = NO;
        picker.allowPickingOriginalPhoto = NO;
        picker.sortAscendingByModificationDate = YES;
        picker.photoWidth = 1080;
        picker.photoPreviewMaxWidth = 1080;
        picker.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.currentVc presentViewController:picker animated:YES completion:NULL];
    }else{/**本地图片预览*/
        
    }
}

-(UIViewController *)currentVc{
    return [AppDelegate currentViewController];
}

#pragma mark ---TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    if (photos.count == 0 || photos.count != assets.count) return;
    [self handlePicsWithPhotos:photos assets:assets];
}

- (HZTFilesModel *)packageImgInfo:(UIImage *)img index:(NSInteger)idx{
    NSString * fileDirectory = [HZTFilesModel hztNoteFilePath];
    CGFloat itemW = (kScreenW - 2*15)/3;
    long long now = (long long)[[NSDate date] timeIntervalSince1970];
    UIImage  * thumnailImg = [HZTUtils redrawImage:img Width:itemW Height:itemW];
    NSString * imgThumailFileName = [NSString stringWithFormat:@"%lld_%d_t.jpg", now, (int)idx];
    NSString * imgFileName = [NSString stringWithFormat:@"%lld_%d.jpg", now, (int)idx];
    [UIImageJPEGRepresentation(thumnailImg, 1.0) writeToFile:[fileDirectory stringByAppendingPathComponent:imgThumailFileName] atomically:NO];
    [UIImageJPEGRepresentation(img, 1.0) writeToFile:[fileDirectory stringByAppendingPathComponent:imgFileName] atomically:NO];
    HZTFilesModel * file = [HZTFilesModel new];
    file.picWidth = img.size.width;
    file.picHeight = img.size.height;
    file.type = @"i";
    file.oriFileName = imgFileName;
    file.thumnailName = imgThumailFileName;
    file.thumnailImage = thumnailImg;
    return file;
}

-(void)handlePicsWithPhotos:(NSArray<UIImage *> *)photos assets:(NSArray *)assets{
    for (int i =0; i<photos.count; i++) {
        HZTFilesModel *file = [self packageImgInfo:photos[i] index:i];
        [self.chooseFileArr addObject:file];
    }
    [self updateContentFiles:self.chooseFileArr];
}

-(NSMutableArray *)chooseFileArr{
    if (!_chooseFileArr) {
        _chooseFileArr = [NSMutableArray array];
    }
    return _chooseFileArr;
}

-(NSMutableArray *)viewsArr{
    if (!_viewsArr) {
        _viewsArr = [NSMutableArray array];
    }
    return _viewsArr;
}

-(void)clearCacheFiles{
    @try {
        for (HZTFilesModel * file in self.chooseFileArr) {
            if (file.oriFileName) {
                NSString *filePath = [[HZTFilesModel hztNoteFilePath] stringByAppendingPathComponent:file.oriFileName];
                [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
            }
            if (file.thumnailName) {
                NSString *thumPath = [[HZTFilesModel hztNoteFilePath] stringByAppendingPathComponent:file.thumnailName];
                [[NSFileManager defaultManager] removeItemAtPath:thumPath error:nil];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

@end
