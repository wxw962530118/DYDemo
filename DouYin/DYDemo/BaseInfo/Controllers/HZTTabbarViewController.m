//
//  HZTTabbarViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTTabbarViewController.h"
#import "HZTRootNavigationController.h"
#import "HZTHomeViewController.h"
#import "HZTMeViewController.h"
#import "HZTTabbarItemModel.h"
#import "HZTFindViewController.h"
#import "JZNavigationExtension.h"
@interface HZTTabbarViewController ()
/**  */
@property (nonatomic,strong) NSMutableArray * tabBarItems;

@end

@implementation HZTTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor blackColor];
    [self configChildControllers];
    [self configTabbarItem];
}

- (HZTTabbarItemModel *)generateItemWithTitle:(NSString *)title unselectImage:(UIImage *)unselectImg selectImage:(UIImage *)selectImg {
    HZTTabbarItemModel * item = [HZTTabbarItemModel new];
    item.title = title;
    item.unSelectImage = unselectImg;
    item.selectImage = selectImg;
    return item;
}

- (void)configTabbarItem {
    if (_tabBarItems.count == 0) return;
    for (NSInteger i = 0; i < _tabBarItems.count; i++) {
        HZTTabbarItemModel * item = _tabBarItems[i];
        UIViewController * vc =item.viewController;
        if (!vc) continue;
        vc.title = item.title;
        vc.tabBarItem.image = [item.unSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [item.selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

-(void)configChildControllers{
    _tabBarItems = [NSMutableArray array];
    HZTHomeViewController * vc0 = [HZTHomeViewController new];
    vc0.jz_navigationBarHidden = YES;
    HZTTabbarItemModel * item0 = [self generateItemWithTitle:@"首页" unselectImage:[UIImage imageNamed:@"tabbar_home_icon_1"] selectImage:[UIImage imageNamed:@"tabbar_home_icon_2"]];
    item0.viewController = vc0;
    item0.tabType = TabBarType_Home;
    [_tabBarItems addObject:item0];
    HZTRootNavigationController * nav0 = [[HZTRootNavigationController alloc] initWithRootViewController:vc0];
    [self addChildViewController:nav0];
    
    HZTFindViewController * vc1 = [HZTFindViewController new];
    vc1.jz_navigationBarHidden = YES;
    HZTTabbarItemModel * item1 = [self generateItemWithTitle:@"发现" unselectImage:[UIImage imageNamed:@"tabbar_find_icon_1"] selectImage:[UIImage imageNamed:@"tabbar_find_icon_2"]];
    item1.viewController = vc1;
    item1.tabType = TabBarType_Find;
    [_tabBarItems addObject:item1];
    HZTRootNavigationController * nav1 = [[HZTRootNavigationController alloc] initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    
    HZTMeViewController * vc2 = [HZTMeViewController new];
    vc2.jz_navigationBarHidden = YES;
    HZTTabbarItemModel * item2 = [self generateItemWithTitle:@"我的" unselectImage:[UIImage imageNamed:@"tabbar_me_icon_1"] selectImage:[UIImage imageNamed:@"tabbar_me_icon_2"]];
    item2.viewController = vc2;
    item2.tabType = TabBarType_Me;
    [_tabBarItems addObject:item2];
    HZTRootNavigationController * nav2 = [[HZTRootNavigationController alloc] initWithRootViewController:vc2];
    [self addChildViewController:nav2];
}

@end
