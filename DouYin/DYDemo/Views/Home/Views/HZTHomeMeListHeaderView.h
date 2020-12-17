//
//  HZTHomeMeListHeaderView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView.h>
NS_ASSUME_NONNULL_BEGIN

@protocol HZTHomeMeListHeaderViewDeleagte <NSObject>
/***/
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedIndex:(NSInteger)index;
@end

@interface HZTHomeMeListHeaderView : UIView
+(instancetype)createView;
/**  */
@property (nonatomic,strong) NSArray * titles;
/***/
@property (nonatomic,strong,readonly) JXCategoryTitleView * categoryView;
/**  */
@property (nonatomic,weak) id<HZTHomeMeListHeaderViewDeleagte> delegate;
/***/
@property (nonatomic, weak) id<JXCategoryViewListContainer> listContainer;
@end

NS_ASSUME_NONNULL_END
