//
//  HZTFindDetailsSectionView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindDetailsSectionView.h"
@interface HZTFindDetailsSectionView ()<JXCategoryViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *categorySurView;
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) JXCategoryIndicatorLineView * lineView;
@end

@implementation HZTFindDetailsSectionView

+(instancetype)create{
    HZTFindDetailsSectionView * view = [[NSBundle mainBundle] loadNibNamed:@"HZTFindDetailsSectionView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

-(void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.categoryView.titles = self.titles;
}

-(void)setListContainer:(id<JXCategoryViewListContainer>)listContainer{
    _listContainer = listContainer;
    self.categoryView.listContainer = listContainer;
}

#pragma mark - JXCategoryViewDelegate
-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
   
}

#pragma mark --- Lazy About
-(JXCategoryTitleView *)categoryView{
    if(!_categoryView){
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0,kScreenW*0.5, 50)];
        _categoryView.indicators = @[self.lineView];
        _categoryView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        _categoryView.delegate = self;
        _categoryView.titleSelectedColor = [UIColor whiteColor];
        _categoryView.titleColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        [self.categorySurView addSubview:_categoryView];
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
@end
