//
//  HZTMeProfileViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/16.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTMeProfileViewController.h"
#import "MainCollectionView.h"
#import "JXPagerListRefreshView.h"
#import "HZTMeProfileSectionView.h"
@interface HZTMeProfileViewController ()<JXPagerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topBgView;

@property (weak, nonatomic) IBOutlet UIView *topInfoView;
@property (weak, nonatomic) IBOutlet UIView *userIconView;

/**  */
@property (nonatomic,strong) HZTMeProfileSectionView * sectionView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) JXPagerListRefreshView * pagerView;
@end

@implementation HZTMeProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人主页";
    self.userIconView.layer.cornerRadius = 30;
    self.userIconView.layer.masksToBounds = YES;
    self.topBgView.backgroundColor = [HZTMainColor colorWithAlphaComponent:0.7];
    self.sectionView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
}

#pragma mark - JXPagerViewDelegate
- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return 100;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.sectionView.height;
}

-(UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.sectionView;
}

-(NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.sectionView.titles.count;
}

-(id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    MainCollectionView * view = [MainCollectionView createView];
    view.count = index==0 ? 30 : 50;
    view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return view;
}

-(HZTMeProfileSectionView *)sectionView{
    if(!_sectionView){
        __weak typeof(self) weakSelf = self;
        _sectionView = [[HZTMeProfileSectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 54) titles:@[@"资料", @"礼物墙", @"动态"]];
        [_sectionView setDidCallBack:^(NSInteger index) {
            weakSelf.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
        }];
    }
    return _sectionView;
}

-(JXPagerListRefreshView *)pagerView {
    if (!_pagerView) {
        _pagerView = [[JXPagerListRefreshView alloc] initWithDelegate:self];
        _pagerView.mainTableView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_pagerView];
        [_pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView);
        }];
    }
    return _pagerView;
}

@end
