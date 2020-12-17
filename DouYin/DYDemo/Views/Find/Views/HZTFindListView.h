//
//  HZTFindListView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTPagerView.h"
typedef NS_ENUM(NSInteger,ListType){
    ListType_Fllow=0,  /*关注列表*/
    ListType_Dynamic,  /*动态列表*/
};

@interface HZTFindListView : HZTPagerView
+(instancetype)createView;
/***/
@property (nonatomic,assign) ListType listType;
/**是否为UiTableView列表  默认为YES  NO:UICollectionView列表*/
@property (nonatomic,assign) BOOL isTableViewList;
@end

