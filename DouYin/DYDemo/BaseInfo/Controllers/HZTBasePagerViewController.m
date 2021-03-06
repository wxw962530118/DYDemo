//
//  HZTBasePagerViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTBasePagerViewController.h"
#import "HZTCustomTitleNavView.h"
#import "MainCollectionView.h"
#import "HZTFindListView.h"
@interface HZTBasePagerViewController ()
@property (nonatomic, strong) HZTCustomTitleNavView * navView;
@end

@implementation HZTBasePagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)loadSubView{
    [self.view addSubview:self.pagerView];
    [self.pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(NavBarHeight);
        make.right.left.bottom.equalTo(self.view);
    }];
    [self.view addSubview:self.navView];
    self.navView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
}

#pragma mark --- JXPagerViewDelegate
- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.pagerHeaderView ?:[UIView new];
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return self.pagerHeaderViewH;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.pagerSectionViewH;
}

-(UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.pagerSectionView ?:[UIView new];;
}

-(NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.categoryTitles.count;
}

-(id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    return [self.pagerViews objectAtIndex:index];
}

#pragma mark --- Lazy About
-(HZTCustomTitleNavView *)navView{
    if(!_navView){
        _navView = [HZTCustomTitleNavView createWithTitles:self.categoryTitles];
    }
    return _navView;
}

-(JXPagerView *)pagerView {
    if (!_pagerView) {
        _pagerView = [[JXPagerView alloc] initWithDelegate:self];
    }
    return _pagerView;
}

@end
