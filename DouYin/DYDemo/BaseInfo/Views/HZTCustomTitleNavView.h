//
//  HZTCustomTitleNavView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView.h>
NS_ASSUME_NONNULL_BEGIN

@interface HZTCustomTitleNavView : UIView
+(instancetype)createWithTitles:(NSArray *)titles;
@property (nonatomic, weak) id<JXCategoryViewListContainer> listContainer;
@end

NS_ASSUME_NONNULL_END
