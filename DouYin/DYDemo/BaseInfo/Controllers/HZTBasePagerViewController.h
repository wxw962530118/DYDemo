//
//  HZTBasePagerViewController.h
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTBaseViewController.h"
#import "JXPagerView.h"
#import "HZTPagerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTBasePagerViewController : HZTBaseViewController<JXPagerViewDelegate>
/**顶部可切换分类数据源*/
@property (nonatomic,strong) NSArray * categoryTitles;
/**底部滚动视图*/
@property (nonatomic,strong) NSArray <HZTPagerView *>* pagerViews;
/**  */
@property (nonatomic,strong) UIView * pagerHeaderView;
/** */
@property (nonatomic,assign) CGFloat pagerHeaderViewH;
/**  */
@property (nonatomic,strong) UIView * pagerSectionView;
/** */
@property (nonatomic,assign) CGFloat pagerSectionViewH;
/**特殊页面<ps:嵌套下拉刷新> 子类自己声明*/
@property (nonatomic, strong) JXPagerView * pagerView;
/**子类必须实现的方法  调用顺序在设置数据源之后*/
-(void)loadSubView;
@end

NS_ASSUME_NONNULL_END
