//
//  MainCollectionView.h
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTPagerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainCollectionView : HZTPagerView
+(instancetype)createView;
/***/
@property (nonatomic, assign) NSInteger count;
@end

NS_ASSUME_NONNULL_END
