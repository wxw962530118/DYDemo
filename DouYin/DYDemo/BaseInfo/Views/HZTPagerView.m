//
//  HZTPagerView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTPagerView.h"

@implementation HZTPagerView

#pragma mark --- JXPagerViewListViewDelegate
- (UIView *)listView {
    return self;
}

- (UIScrollView *)listScrollView {
    return nil;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    
}

@end
