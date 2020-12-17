//
//  HZTFindFileView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTFilesModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTFindFileView : UIView
/**  */
@property (nonatomic,strong) HZTFilesModel * model;
/** */
@property(nonatomic,copy) void (^clickTheView)(HZTFilesModel * item);
@end

NS_ASSUME_NONNULL_END
