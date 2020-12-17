//
//  HZTPublishTextView.h
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZTPublishTextView : UIView
+(instancetype)create;
/**  */
@property (nonatomic,assign) int maxLen;
/**  */
@property (nonatomic,copy,readonly) NSString * realText;
@end

NS_ASSUME_NONNULL_END
