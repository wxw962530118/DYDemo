//
//  SectionView.m
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "SectionView.h"
#import <JXCategoryView.h>
@interface SectionView ()<JXCategoryViewDelegate>
/***/
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@end

@implementation SectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadCategoryView];
    }
    return self;
}

-(void)loadCategoryView{
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,50)];
        self.categoryView.titles = @[@"作品10",@"动态11",@"喜欢1000"];
        self.categoryView.backgroundColor = [UIColor whiteColor];
        self.categoryView.delegate = self;
        self.categoryView.titleSelectedColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
        self.categoryView.titleColor = [UIColor blackColor];
        self.categoryView.titleColorGradientEnabled = YES;
        self.categoryView.titleLabelZoomEnabled = YES;
        self.categoryView.contentScrollViewClickTransitionAnimationEnabled = NO;
        JXCategoryIndicatorLineView * lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
        lineView.indicatorWidth = 30;
        self.categoryView.indicators = @[lineView];
    }
    
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"curIndex%ld",index);
}

@end
