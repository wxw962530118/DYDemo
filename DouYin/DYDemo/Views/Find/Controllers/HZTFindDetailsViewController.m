//
//  HZTFindDetailsViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindDetailsViewController.h"
#import "HZTBaseTableListView.h"
#import "HZTFindDetailsSectionView.h"
#import "HZTFindListCell.h"
@interface HZTFindDetailsViewController ()
/**  */
@property (nonatomic,strong) HZTFindDetailsSectionView * sectionView;
/**  */
@property (nonatomic,strong) HZTFindListCell * headerView;

@end

@implementation HZTFindDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configInfo];
    [super loadSubView];
    self.sectionView.listContainer = self.listContainer;
    self.headerView.layout = self.layout;
}

-(HZTFindListCell *)headerView{
    if (!_headerView) {
        _headerView = [[NSBundle mainBundle] loadNibNamed:@"HZTFindListCell" owner:nil options:nil].firstObject;
    }
    return _headerView;
}

-(HZTFindDetailsSectionView *)sectionView{
    if (!_sectionView) {
        _sectionView = [HZTFindDetailsSectionView create];
        _sectionView.titles = @[@"评论",@"礼物"];
        _sectionView.frame = CGRectMake(0, 0, kScreenW, 50);
    }
    return _sectionView;
}

-(void)configInfo{
    self.navigationItem.title = @"动态详情";
    self.isHiddenNav = YES;
    self.pagerSectionView = self.sectionView;
    self.pagerSectionViewH = self.sectionView.height;
    self.pagerHeaderView = self.headerView;
    self.pagerHeaderViewH = self.layout.cellH;
    self.categoryTitles = self.sectionView.titles;
    self.pagerViews = @[[HZTBaseTableListView create],[HZTBaseTableListView create]];
}

@end
