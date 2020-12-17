//
//  HZTFindListLayout.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZTFindListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTFindListLayout : NSObject
/**  */
@property (nonatomic,assign) CGFloat marginH;
/**  */
@property (nonatomic,assign) CGFloat marginV;
/**  */
@property (nonatomic,assign) CGFloat leftPading;
/**  */
@property (nonatomic,assign) CGFloat rightPading;
/**  */
@property (nonatomic,assign) CGFloat cellH;
/**  */
@property (nonatomic,strong) HZTFindListModel * listModel;
-(void)prepareLayout;
@end

NS_ASSUME_NONNULL_END
