//
//  HZTBaseTableListLayout.h
//  DYDemo
//
//  Created by wangxw on 2020/12/18.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZTBaseTableListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTBaseTableListLayout : NSObject
/**  */
@property (nonatomic,assign) CGFloat cellH;
/**  */
@property (nonatomic,strong) HZTBaseTableListModel * model;

@end

NS_ASSUME_NONNULL_END
