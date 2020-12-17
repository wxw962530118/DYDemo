//
//  HZTPublishFileView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTFilesModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTPublishFileView : UIView
/**提供给外界的已经包装好的数据源*/
@property (nonatomic,strong,readonly) NSMutableArray * chooseFileArr;
/**已有的数据源*/
-(void)updateContentFiles:(NSArray *)files;
/**  */
@property(nonatomic,copy) void(^updateHBlcok) (CGFloat height);
/***/
-(void)clearCacheFiles;
@end

NS_ASSUME_NONNULL_END
