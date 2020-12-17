//
//  AppDelegate.m
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "AppDelegate.h"
#import "HZTRootNavigationController.h"
#import "HZTTabbarViewController.h"
#import "JZNavigationExtension.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    HZTTabbarViewController * tabVc = [HZTTabbarViewController new];
    tabVc.jz_navigationBarHidden = YES;
    HZTRootNavigationController * nav = [[HZTRootNavigationController alloc] initWithRootViewController:tabVc];
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

+(void)pushViewController:(nullable UIViewController *)viewController animated:(BOOL)animated{
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UINavigationController * rootController = (UINavigationController *) delegate.window.rootViewController;
    [rootController pushViewController:viewController animated:animated];
}

+(void)popViewControllerAnimated:(BOOL)animated{
    
}

+(void)popToRootViewControllerAnimated:(BOOL)animated{
    
}

+(void)popToLogginViewControllerAnimated:(BOOL)animated{
    
}

+(HZTBaseViewController *)currentViewController{
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UINavigationController * rootController = (UINavigationController *) delegate.window.rootViewController;
    if (rootController.topViewController) {
        return (HZTBaseViewController *)rootController.topViewController;
    }else if (rootController.viewControllers.count>0){
        return (HZTBaseViewController *)rootController.viewControllers.lastObject;
    }else{
        return nil;
    }
}

@end
