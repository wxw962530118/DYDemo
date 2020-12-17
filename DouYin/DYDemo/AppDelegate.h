//
//  AppDelegate.h
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTBaseViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
/***/
@property (nonatomic, strong) UIWindow * _Nonnull window;
/***/
+(void)pushViewController:(nullable UIViewController *)viewController animated:(BOOL)animated;
/***/
+(void)popViewControllerAnimated:(BOOL)animated;
/***/
+(void)popToRootViewControllerAnimated:(BOOL)animated;
/***/
+(void)popToLogginViewControllerAnimated:(BOOL)animated;
+(HZTBaseViewController *)currentViewController;
@end

