//
//  HZTHomeViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTHomeViewController.h"
#import "HZTPagerView.h"
#import <MJRefreshNormalHeader.h>
#import "HZTHomeMeListViewController.h"
#import "JXPagerListRefreshView.h"
@interface HZTHomeViewController ()

@end

@implementation HZTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.categoryTitles = @[@"我的",@"流行"];
    self.pagerView = [[JXPagerListRefreshView alloc] initWithDelegate:self];
    self.pagerViews = @[[HZTHomeMeListViewController new],[self getView]];
    [super loadSubView];
}

-(UIView *)getView{
    HZTPagerView * view = [HZTPagerView new];
    view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return view;
}

@end
