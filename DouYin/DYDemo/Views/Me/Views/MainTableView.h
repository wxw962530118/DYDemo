//
//  MainTableView.h
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPagerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainTableView : UIView<JXPagerViewListViewDelegate>
+(instancetype)createView;
@end

NS_ASSUME_NONNULL_END
