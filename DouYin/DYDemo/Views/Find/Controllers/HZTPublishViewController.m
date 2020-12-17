//
//  HZTPublishViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/11.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTPublishViewController.h"
#import "HZTPublishFileView.h"
#import "HZTPublishTextView.h"
static NSString * const tipsKey = @"*When your post is rewarded by other users,you will get 80% revenue. Goto create insteresting posts to attract more people to attention you!!!";
@interface HZTPublishViewController ()
@property (weak, nonatomic) IBOutlet UIView *topActionView;
@property (weak, nonatomic) IBOutlet UIView *textContentView;
@property (weak, nonatomic) IBOutlet UIView *fileContentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentVHConstraint;
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fileContentVHContraint;
@property (weak, nonatomic) IBOutlet UIButton *publishBtn;
@property (nonatomic,strong) HZTPublishFileView * fileView;
@property (nonatomic,strong) HZTPublishTextView * textView;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@end

@implementation HZTPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布页";
    [self addEndEditGesture];
    self.tipsLabel.text = tipsKey;
    self.tipsLabel.textColor = [HZTMainColor colorWithAlphaComponent:.54];
    [self.topActionView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(choosePublishTopic)]];
    self.textView.frame = CGRectMake(15, 0,kScreenW-2*15,150);
    [self.fileView updateContentFiles:@[]];
}

-(HZTPublishTextView *)textView{
    if (!_textView) {
        _textView =[HZTPublishTextView create];
        [self.textContentView addSubview:_textView];
    }
    return _textView;
}

-(HZTPublishFileView *)fileView{
    if (!_fileView) {
        __weak typeof(self) weakSelf = self;
        _fileView = [HZTPublishFileView new];
        [self.fileContentView addSubview:_fileView];
        [_fileView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.left.equalTo(weakSelf.fileView.superview);
        }];
        [_fileView setUpdateHBlcok:^(CGFloat height) {
            CGFloat tipsH = [HZTUtils getHeightWithString:weakSelf.tipsLabel.text width:kScreenW-2*15 font:[UIFont systemFontOfSize:15]];
            weakSelf.fileContentVHContraint.constant = height;
            weakSelf.contentVHConstraint.constant = 50 + 150 + 10 + height + 50 + 5 + tipsH + 10;
        }];
    }
    return _fileView;
}

#pragma mark --- 选择位置
- (IBAction)clickLocationBtn:(id)sender {
    NSLog(@"clickLocationBtn");
}

#pragma mark --- 选择范围
- (IBAction)clickPublishBtn:(id)sender {
    NSLog(@"clickPublishBtn");
}

#pragma mark --- 选择发布话题
-(void)choosePublishTopic{
    NSLog(@"choosePublishTopic");
}

#pragma mark --- 清空本地临时数据
-(void)dealloc{
    NSLog(@"realText:%@",self.textView.realText);
    [self.fileView clearCacheFiles];
}

@end
