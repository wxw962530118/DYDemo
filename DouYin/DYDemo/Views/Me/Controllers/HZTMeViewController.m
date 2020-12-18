//
//  HZTMeViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTMeViewController.h"
#import "SectionView.h"
#import <JXCategoryView.h>
#import "TableHeaderView.h"
#import "NavBarView.h"
#import "HZTBaseCollectionViewController.h"
#import "HZTBaseTableViewController.h"
#define kHeaderViewH 300
#define kSectionViewH 50
@interface HZTMeViewController ()<JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) NSArray <NSString *> * titles;
@property (nonatomic, strong) TableHeaderView * headerView;
@property (nonatomic, strong) JXCategoryIndicatorLineView * lineView;
@property (nonatomic, strong) NavBarView * navView;
@property (nonatomic, assign) NSInteger curIndex;
@end

@implementation HZTMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.curIndex = -1;
    self.categoryView.indicators = @[self.lineView];
    self.pagerView.mainTableView.gestureDelegate = self;
    [self.view addSubview:self.navView];
    self.pagerView.pinSectionHeaderVerticalOffset = NavBarHeight;
    self.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
}

#pragma mark - JXPagerViewDelegate
- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.headerView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return kHeaderViewH;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return kSectionViewH;
}

-(UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.categoryView;
}

-(NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.categoryView.titles.count;
}

-(id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    if (index==0 || index==2) {
        return [HZTBaseCollectionViewController new];
    }else{
        return [HZTBaseTableViewController new];
    }
}

-(void)pagerView:(JXPagerView *)pagerView mainTableViewDidScroll:(UIScrollView *)scrollView{
    [self.navView scrollViewDidScroll:scrollView.contentOffset.y];
    [self.headerView scrollViewDidScroll:scrollView.contentOffset.y];
}

#pragma mark - JXCategoryViewDelegate
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    if (self.curIndex == index) return;
    if (self.curIndex != index) self.curIndex = index;
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    [self.pagerView.mainTableView setContentOffset:CGPointMake(0, 0) animated:NO];
}

#pragma mark - JXPagerMainTableViewGestureDelegate
-(BOOL)mainTableViewGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (otherGestureRecognizer == self.categoryView.collectionView.panGestureRecognizer) {
        return NO;
    }
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

#pragma mark --- Lazy About
-(JXCategoryTitleView *)categoryView{
    if(!_categoryView){
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0,kScreenW, 50)];
        _categoryView.titles = self.titles;
        _categoryView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        _categoryView.delegate = self;
        _categoryView.titleSelectedColor = [UIColor whiteColor];
        _categoryView.titleColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    }
    return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if(!_lineView){
        _lineView = [[JXCategoryIndicatorLineView alloc] init];
        _lineView.indicatorColor = [UIColor yellowColor];
        _lineView.indicatorWidth = 64;
        _lineView.lineStyle = JXCategoryIndicatorLineStyle_LengthenOffset;
    }
    return _lineView;
}

-(NSArray *)titles{
    if (!_titles) {
        _titles = @[@"作品10", @"动态10", @"喜欢1000"];
    }
    return _titles;
}

-(TableHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [TableHeaderView createView:self];
    }
    return _headerView;
}

-(JXPagerView *)pagerView {
    if (!_pagerView) {
        _pagerView = [[JXPagerView alloc] initWithDelegate:self];
        [self.view addSubview:_pagerView];
        [_pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-49-SafeAreaBottom());
        }];
    }
    return _pagerView;
}

-(NavBarView *)navView{
    if(!_navView){
        _navView = [NavBarView createView];
        _navView.height = kHeaderViewH;
        _navView.frame = CGRectMake(0, 0, kScreenW, NavBarHeight);
    }
    return _navView;
}

@end
