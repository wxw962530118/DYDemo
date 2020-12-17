//
//  TableHeaderView.h
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableHeaderView : UIView
+(instancetype)createView:(UIViewController *)vc;
- (void)scrollViewDidScroll:(CGFloat)contentOffsetY;
@end

NS_ASSUME_NONNULL_END
