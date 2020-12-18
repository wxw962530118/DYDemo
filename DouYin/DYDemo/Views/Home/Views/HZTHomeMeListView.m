//
//  HZTHomeMeListView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTHomeMeListView.h"
#import "HZTHomeLiveItemListView.h"
#import "HZTHomeMeListHeaderView.h"
@interface HZTHomeMeListView ()<JXPagerMainTableViewGestureDelegate,HZTHomeMeListHeaderViewDeleagte,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryListContainerView * containerView;
@property (nonatomic,strong) HZTHomeMeListHeaderView * headerView;
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@property (nonatomic, strong) UIScrollView *currentListView;
/**  */
@property (nonatomic,strong) NSArray * titles;
@end

@implementation HZTHomeMeListView

-(instancetype)initWithDelegate:(id<JXPagerViewDelegate>)delegate{
    if (self = [super initWithDelegate:delegate]) {
        self.titles = @[@"历史",@"新增",@"关注"];
        self.headerView.titles = self.titles;
        self.headerView.listContainer = self.containerView;
    }
    return self;
}

#pragma mark --- JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
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

#pragma mark - JXPagerMainTableViewGestureDelegate
-(BOOL)mainTableViewGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {/**禁止categoryView左右滑动的时候，上下和左右都可以滚动*/
    if (otherGestureRecognizer == self.headerView.categoryView.collectionView.panGestureRecognizer) {
        return NO;
    }
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

#pragma mark - JXCategoryViewDelegate
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedIndex:(NSInteger)index {
    NSLog(@"cur index is:%ld",index);/**根据选中的下标，实时更新currentListView*/
    HZTHomeLiveItemListView * listView = (HZTHomeLiveItemListView *)self.containerView.validListDict[@(index)];
    self.currentListView = listView.mainCollectionView;
}

#pragma mark - JXCategoryViewDelegate

-(HZTHomeMeListHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [HZTHomeMeListHeaderView createView];
        _headerView.delegate = self;
        _headerView.frame = CGRectMake(0, 0,kScreenW, 150);
        [self addSubview:_headerView];
    }
    return _headerView;
}

-(JXCategoryListContainerView *)containerView{
    if (!_containerView) {
        _containerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
        [self addSubview:_containerView];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(self.headerView.height);
            make.right.left.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-(49 + SafeAreaBottom()));
        }];
    }
    return _containerView;
}

- (UIView *)listView {
    return self;
}

- (UIScrollView *)listScrollView {
    return self.currentListView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

@end
