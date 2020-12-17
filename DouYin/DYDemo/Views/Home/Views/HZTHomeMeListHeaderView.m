//
//  HZTHomeMeListHeaderView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTHomeMeListHeaderView.h"
@interface HZTHomeMeListHeaderView ()<JXCategoryViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *titleSurView;
/**  */
@property (nonatomic,strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) JXCategoryIndicatorBackgroundView * lineView;
/**  */
@property (nonatomic,assign) NSInteger curIndex;
@end

@implementation HZTHomeMeListHeaderView

+(instancetype)createView{
    HZTHomeMeListHeaderView * view = [[NSBundle mainBundle] loadNibNamed:@"HZTHomeMeListHeaderView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.lineView = [JXCategoryIndicatorBackgroundView new];
    self.lineView.indicatorHeight = 30;
}

-(void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.categoryView.indicators = @[self.lineView];
    self.lineView.indicatorWidth = 10 + [HZTUtils getWidthWithString:titles.firstObject font:[UIFont systemFontOfSize:15]] + 10;
}

-(void)setListContainer:(id<JXCategoryViewListContainer>)listContainer{
    _listContainer = listContainer;
    self.categoryView.listContainer = listContainer;
}

#pragma mark - JXCategoryViewDelegate
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    if (self.curIndex == index) return;
    if (self.curIndex != index) self.curIndex = index;
    self.lineView.indicatorWidth = 10 + [HZTUtils getWidthWithString:self.titles[index] font:[UIFont systemFontOfSize:15]] + 10;
    if (self.delegate && [self.delegate respondsToSelector:@selector(categoryView:didSelectedIndex:)]) {
        [self.delegate categoryView:categoryView didSelectedIndex:index];
    }
}

-(JXCategoryTitleView *)categoryView{
    if(!_categoryView){
        CGFloat width = 0;
        for (int i =0; i<self.titles.count; i++) {
            width += [HZTUtils getWidthWithString:self.titles[i] font:[UIFont systemFontOfSize:15]];
        }
        width += (20 * (self.titles.count + 1));
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0,width, 44)];
        _categoryView.titles = self.titles;
        _categoryView.delegate = self;
        _categoryView.defaultSelectedIndex = 0;
        _categoryView.titleSelectedColor = [UIColor whiteColor];
        _categoryView.titleColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        [self.titleSurView addSubview:_categoryView];
    }
    return _categoryView;
}

@end
