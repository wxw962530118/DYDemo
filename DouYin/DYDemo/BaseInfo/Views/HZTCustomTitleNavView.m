//
//  HZTCustomTitleNavView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTCustomTitleNavView.h"

@interface HZTCustomTitleNavView ()<JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryIndicatorLineView * lineView;
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
/**  */
@property (nonatomic,assign) NSInteger curIndex;
@end

@implementation HZTCustomTitleNavView
+(instancetype)createWithTitles:(NSArray *)titles{
    HZTCustomTitleNavView * view = [[HZTCustomTitleNavView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, NavBarHeight) titles:titles];
    return view;
}

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HZTMainColor;
        [self loadTitleView:titles];
    }
    return self;
}

-(JXCategoryIndicatorLineView *)lineView{
    if(!_lineView){
        _lineView = [[JXCategoryIndicatorLineView alloc] init];
        _lineView.indicatorColor = [UIColor whiteColor];
        _lineView.indicatorWidth = 15;
        _lineView.lineStyle = JXCategoryIndicatorLineStyle_LengthenOffset;
    }
    return _lineView;
}

-(void)loadTitleView:(NSArray *)titles{
    CGFloat width = 0;
    for (int i =0; i<titles.count; i++) {
        width += [HZTUtils getWidthWithString:titles[i] font:[UIFont systemFontOfSize:17 weight:UIFontWeightMedium]];
    }
    width += (20 * (titles.count + 1));
    if(!_categoryView){
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,StatusHeight,width,self.frame.size.height-StatusHeight)];
        _categoryView.titles = titles;
        _categoryView.delegate = self;
        _categoryView.titleFont = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
        _categoryView.titleSelectedColor = [UIColor whiteColor];
        _categoryView.titleColor = [[UIColor whiteColor] colorWithAlphaComponent:0.38];
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.titleLabelZoomEnabled = YES;
        _categoryView.indicators = @[self.lineView];
        [self addSubview:_categoryView];
    }
}

-(void)setListContainer:(id<JXCategoryViewListContainer>)listContainer{
    _listContainer = listContainer;
    self.categoryView.listContainer = listContainer;
}

#pragma mark - JXCategoryViewDelegate
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    if (self.curIndex == index) return;
    if (self.curIndex != index) self.curIndex = index;
}

@end
