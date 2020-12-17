//
//  HZTTabbarItemModel.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, TabBarType) {
    TabBarType_Home,        //首页
    TabBarType_Find = 1,    //发现
    TabBarType_Me = 2,      //我的
};

@interface HZTTabbarItemModel : NSObject
@property (nonatomic, assign) TabBarType tabType;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *unSelectImage;
@property (nonatomic, strong) UIImage *selectImage;
@end

NS_ASSUME_NONNULL_END
