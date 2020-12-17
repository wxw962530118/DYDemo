//
//  HZTBaseNavigationController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTBaseNavigationController.h"
#import "JZNavigationExtension.h"
@interface HZTBaseNavigationController ()

@end

@implementation HZTBaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if ([super initWithRootViewController:rootViewController]) {
        [self configBasicNavigation];
    }
    return self;
}

-(instancetype)init{
    if ([super init]) {
        [self configBasicNavigation];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configBasicNavigation {
    [self.navigationBar setTranslucent:false];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[HZTUtils imageWithColor:HZTMainColor] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.jz_navigationBarHidden = NO;
    self.jz_navigationBarBackgroundAlpha = 1.f;
    self.navigationController.jz_fullScreenInteractivePopGestureEnabled = YES;
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18 weight:UIFontWeightMedium], NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
