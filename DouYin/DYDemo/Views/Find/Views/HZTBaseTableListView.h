//
//  HZTBaseTableListView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPagerView.h"
#import "HZTBaseTableListLayout.h"
#import "HZTBaseTableListCell.h"
NS_ASSUME_NONNULL_BEGIN
@interface HZTBaseTableListView : UIView<JXPagerViewListViewDelegate>
+(instancetype)create;
-(void)configDatas:(NSArray <HZTBaseTableListLayout *>*)datas registerClass:(Class)cellClass isFromNib:(BOOL)isFromNib callBack:(void (^)(NSInteger index))callBack;
@end

NS_ASSUME_NONNULL_END
