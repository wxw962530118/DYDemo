//
//  HZTHomeMeListViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/18.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTHomeMeListViewController.h"
#import <JXCategoryView/JXCategoryView.h>
#import "HZTHomeLiveItemListView.h"
#import "HZTHomeMeListHeaderView.h"
#define kHeaderH 150
@interface HZTHomeMeListViewController ()<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate,HZTHomeMeListHeaderViewDeleagte>
@property (nonatomic,strong) HZTHomeMeListHeaderView * headerView;
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@property (nonatomic, strong) UIScrollView *currentListView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@end

@implementation HZTHomeMeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.headerView.titles = @[@"历史",@"新增",@"关注"];
    self.listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    [self.view addSubview:self.listContainerView];
    self.headerView.listContainer = self.listContainerView;
    [self.listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(kHeaderH);
        make.right.bottom.left.equalTo(self.view);
    }];
}

-(HZTHomeMeListHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [HZTHomeMeListHeaderView createView];
        _headerView.delegate = self;
        _headerView.frame = CGRectMake(0, 0,kScreenW, kHeaderH);
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

#pragma  mark --- JXPagerViewListViewDelegate
- (UIView *)listView {
    return self.view;
}

- (UIScrollView *)listScrollView {
    return self.currentListView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

#pragma mark - HZTHomeMeListHeaderViewDeleagte
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedIndex:(NSInteger)index {
    /**根据选中的下标，实时更新currentListView*/
    HZTHomeLiveItemListView *list = (HZTHomeLiveItemListView *)self.listContainerView.validListDict[@(index)];
    self.currentListView = list.mainCollectionView;
}

#pragma mark - JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.headerView.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    __weak typeof(self) weakSelf = self;
    HZTHomeLiveItemListView * listView = [HZTHomeLiveItemListView createView];
    self.currentListView = listView.mainCollectionView;
    [listView setScrollCallback:^(UIScrollView * _Nonnull scrollView) {
        if(weakSelf.scrollCallback) weakSelf.scrollCallback(scrollView);
    }];
    return listView;
}

@end
