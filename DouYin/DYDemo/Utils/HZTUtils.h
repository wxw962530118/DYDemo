//
//  HZTUtils.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define CurrentVersion                 [ToolBaseClass getCurrentVersion]

@interface HZTUtils : NSObject
/**获取应用根视图 */
+(UIWindow *)getRootWindow;
/**获取当前版本号 */
+(NSString *)getCurrentVersion;
/**计算字符串的高度 (包括对多行文字的处理) */
+(CGFloat)getHeightWithString:(NSString *)string width:(CGFloat)width font:(UIFont *)font;
/**精确计算文本内容高度*/
+(CGFloat)getContentPreciseWith:(UIView *)obj width:(CGFloat )width;
/**计算字符串的宽度 */
+(CGFloat)getWidthWithString:(NSString *)string font:(UIFont *)font;
/**判断对象是否为null nil length是否为0*/
+(BOOL)isNullClass:(NSObject *)obj;
/**用颜色生成图片*/
+(UIImage *)imageWithColor:(UIColor *)color;
/**存储用户偏好*/
+(BOOL)saveUserDefaultsWithKey:(NSString *)key value:(id)value;
/**获取存储用户偏好*/
+(id)getUserDefaultsWithKey:(NSString *)key;
/**删除存储的用户偏好*/
+(void)removeUserDefaultsWithKey:(NSString *)key;
/**判断设备是否底部带有安全区域*/
+(BOOL)hasSafeArea;
/**格式化时间戳 是否以.连接*/
+(NSString *)dateWithTimeInterval:(NSTimeInterval)timeInterval isAdot:(BOOL)isAdot;
//图片质量比例压缩
+ (UIImage *)compress:(UIImage *)image Scale:(float)scale;
//图片固定大小压缩
+ (UIImage *)redrawImage:(UIImage *)img Width:(NSInteger)width Height:(NSInteger)height;
@end

CG_INLINE BOOL IS_IPhoneX(){
    return [HZTUtils hasSafeArea];
};
