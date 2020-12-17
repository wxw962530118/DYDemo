//
//  HZTMeProfileSectionView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/16.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTMeProfileSectionView.h"
@interface HZTMeProfileSectionView ()<JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) JXCategoryIndicatorBackgroundView * lineView;
@property (nonatomic, assign) NSInteger curIndex;
@property (nonatomic, strong) NSArray <NSString *> * titles;
@end

@implementation HZTMeProfileSectionView

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles{
    if(self = [super initWithFrame:frame]){
        self.titles = titles;
        self.backgroundColor = [UIColor clearColor];
        self.curIndex = -1;
        self.categoryView.indicators = @[self.lineView];
    }
    return self;
}

-(void)setListContainer:(id<JXCategoryViewListContainer>)listContainer{
    _listContainer = listContainer;
    self.categoryView.listContainer = listContainer;
}

#pragma mark - JXCategoryViewDelegate
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    if (self.curIndex == index) return;
    if (self.curIndex != index) self.curIndex = index;
    if(self.didCallBack) self.didCallBack(index);
}

#pragma mark --- Lazy About
-(JXCategoryTitleView *)categoryView{
    if(!_categoryView){
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(30, 0,self.width-2*30, self.height)];
        _categoryView.layer.cornerRadius = self.height*0.5;
        _categoryView.contentEdgeInsetLeft = 30;
        _categoryView.contentEdgeInsetRight = 30;
        _categoryView.layer.masksToBounds = YES;
        _categoryView.titles = self.titles;
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.delegate = self;
        _categoryView.titleSelectedColor = [UIColor whiteColor];
        _categoryView.titleColor = [HZTMainColor colorWithAlphaComponent:0.7];;
        [self addSubview:_categoryView];
    }
    return _categoryView;
}

-(JXCategoryIndicatorBackgroundView *)lineView{
    if(!_lineView){
        _lineView = [JXCategoryIndicatorBackgroundView new];
        _lineView.indicatorColor = HZTMainColor;
        _lineView.indicatorHeight = self.categoryView.height;
        _lineView.indicatorWidth = (self.categoryView.width-(self.titles.count-1)*30)/self.titles.count;
    }
    return _lineView;
}

@end
