//
//  HZTFindViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindViewController.h"
#import "HZTFindListView.h"
#import "HZTPublishViewController.h"
#import "HZTBaseCollectionViewController.h"
@interface HZTFindViewController ()
@property (weak, nonatomic) IBOutlet UIButton *publishBtn;
@end

@implementation HZTFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configInfo];
    [super loadSubView];
    self.publishBtn.layer.cornerRadius = 32;
    self.publishBtn.layer.masksToBounds = YES;
    [self.view bringSubviewToFront:self.publishBtn];
}

-(void)configInfo{
    self.categoryTitles = @[@"关注",@"动态"];
    self.pagerViews = @[[HZTBaseCollectionViewController new],[HZTFindListView createView]];
}

- (IBAction)clickPublishBtn:(id)sender {
    HZTPublishViewController * vc = [HZTPublishViewController new];
    [AppDelegate pushViewController:vc animated:YES];
}


@end
