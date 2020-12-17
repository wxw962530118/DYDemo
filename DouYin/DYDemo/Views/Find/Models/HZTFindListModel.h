//
//  HZTFindListModel.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZTMediaFileModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTFindListModel : NSObject
/**  */
@property (nonatomic,copy) NSString * userId;
/**  */
@property (nonatomic,copy) NSString * userIcon;
/**  */
@property (nonatomic,assign) long long publishAt;
/**  */
@property (nonatomic,copy) NSString * text;
/**  */
@property (nonatomic,strong) NSArray <HZTMediaFileModel *>* files;
@end

NS_ASSUME_NONNULL_END
