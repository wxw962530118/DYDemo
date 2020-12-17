//
//  TableHeaderView.m
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "TableHeaderView.h"
#import <TZImagePickerController.h>
@interface TableHeaderView ()<TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewTop;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (nonatomic, weak) UIViewController * curentVc;
@property (nonatomic, assign) BOOL isChooseBg;
@end

@implementation TableHeaderView

+(instancetype)createView:(UIViewController *)vc{
    TableHeaderView * view = [[NSBundle mainBundle] loadNibNamed:@"TableHeaderView" owner:nil options:nil].firstObject;
    view.curentVc = vc;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.userImgView.layer.cornerRadius = 32;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
    [self.imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)]];
    [self.userImgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)]];
}

-(void)clickImgView:(UITapGestureRecognizer *)ges{
    UIImageView * imgView = (UIImageView *)[ges view];
    self.isChooseBg = imgView.tag==1000;/**选择头像*/
    TZImagePickerController * pickVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    pickVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.curentVc presentViewController:pickVc animated:YES completion:nil];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    if(self.isChooseBg) self.userImgView.image = photos.firstObject;
    else self.imgView.image = photos.firstObject;
}

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY {
    NSLog(@"contentOffsetY:%.2f",contentOffsetY);
    if (contentOffsetY < 0) {
        float diff = fabs(contentOffsetY);
        self.imgViewH.constant = 150+diff; /**150是顶部图片的默认高度*/
        self.imgViewTop.constant = contentOffsetY;
    }
}

@end
