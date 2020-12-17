//
//  HZTMeProfileSectionView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/16.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView.h>
NS_ASSUME_NONNULL_BEGIN

@interface HZTMeProfileSectionView : UIView
-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
@property (nonatomic,copy) void (^didCallBack)(NSInteger index);
@property (nonatomic, weak) id<JXCategoryViewListContainer> listContainer;
@property (nonatomic, strong,readonly) NSArray <NSString *> * titles;
@end

NS_ASSUME_NONNULL_END
