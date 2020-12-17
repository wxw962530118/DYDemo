//
//  HZTFindViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindViewController.h"
#import "HZTFindListView.h"
#import "MainCollectionView.h"
@interface HZTFindViewController ()
@end

@implementation HZTFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configInfo];
    [super loadSubView];
}

-(void)configInfo{
    self.categoryTitles = @[@"关注",@"动态"];
    self.pagerViews = @[[MainCollectionView createView],[HZTFindListView createView]];
}

@end
