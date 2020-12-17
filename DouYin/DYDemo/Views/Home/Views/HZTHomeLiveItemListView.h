//
//  HZTHomeLiveItemListView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTPagerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTHomeLiveItemListView : UIView<JXCategoryListContentViewDelegate>
+(instancetype)createView;
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@property (weak, nonatomic,readonly) IBOutlet UICollectionView *mainCollectionView;
@end

NS_ASSUME_NONNULL_END
