//
//  HZTFindListCell.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindListCell.h"

@interface HZTFindListCell ()
@property (weak, nonatomic) IBOutlet UIView *iconSurView;
@property (weak, nonatomic) IBOutlet UILabel *userInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *fileSurView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileVHConstraint;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (nonatomic,strong) NSMutableArray * viewsArr;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolVTopConstrint;
@end

@implementation HZTFindListCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setLayout:(HZTFindListLayout *)layout{
    _layout = layout;
    self.contentLabel.text = layout.listModel.text;
    self.contentLabel.hidden = layout.listModel.text.length==0;
    self.fileSurView.hidden = layout.listModel.files.count==0;
    if (layout.listModel.files.count>0) {
        self.toolVTopConstrint.constant = 10;
        self.fileVHConstraint.constant = CGRectGetMaxY([layout.listModel.files.lastObject.rectValue CGRectValue]);
        int cnt = 0;
        for (int i = 0; i< layout.listModel.files.count; i++) {
            HZTMediaFileModel * fileModel = layout.listModel.files[i];
            if (i>=self.viewsArr.count) {
                UIImageView * view = [[UIImageView alloc] initWithFrame:[fileModel.rectValue CGRectValue]];
                view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
                [self.viewsArr addObject:view];
                [self.fileSurView addSubview:view];
            }
            cnt++;
            UIImageView * view = self.viewsArr[i];
            view.hidden = NO;
        }
        for (int i = cnt; i< self.viewsArr.count; i++) {
            UIImageView * view = self.viewsArr[i];
            view.hidden = YES;
        }
    }else{
        self.toolVTopConstrint.constant = 0;
        self.fileVHConstraint.constant = 0;
    }
}

-(NSMutableArray *)viewsArr{
    if(!_viewsArr){
        _viewsArr = [NSMutableArray array];
    }
    return _viewsArr;
}

@end
