//
//  HZTMediaFileModel.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZTMediaFileModel : NSObject
/**  */
@property (nonatomic,assign) CGFloat width;
/**  */
@property (nonatomic,assign) CGFloat height;
/**  */
@property (nonatomic,copy) NSString * url;
/**  */
@property (nonatomic,strong) NSValue * rectValue;
@end

NS_ASSUME_NONNULL_END
