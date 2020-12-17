//
//  HZTMeViewController.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTBaseViewController.h"
#import "JXPagerView.h"
NS_ASSUME_NONNULL_BEGIN
@interface HZTMeViewController : HZTBaseViewController<JXPagerViewDelegate, JXPagerMainTableViewGestureDelegate>
@property (nonatomic, strong) JXPagerView * pagerView;
@end

NS_ASSUME_NONNULL_END
