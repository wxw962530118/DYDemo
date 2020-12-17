//
//  HZTBaseTableListView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPagerView.h"
NS_ASSUME_NONNULL_BEGIN
@interface HZTBaseTableListView : UIView<JXPagerViewListViewDelegate>
+(instancetype)create;
@end

NS_ASSUME_NONNULL_END
