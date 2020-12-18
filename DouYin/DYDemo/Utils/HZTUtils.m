//
//  HZTUtils.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTUtils.h"
#import "AppDelegate.h"
#import "UIImage+circleImage.h"
@implementation HZTUtils
/**颜色转换为背景图片*/
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (NSString *)getCurrentVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/**获取Window*/
+ (UIWindow *)getRootWindow{
    NSArray * windows = [UIApplication sharedApplication].windows;
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)&&window==delegate.window)
            return window;
    }
    return [[UIApplication sharedApplication].delegate window];
}

+ (BOOL)isNullClass:(NSObject *)obj{
    if (!obj || obj == nil || [obj isKindOfClass:[NSNull class]]){
        return YES;
    }else if ([obj isKindOfClass:[NSString class]]){
        NSString * str = (NSString *)obj;
        return str.length == 0;
    }else if ([obj isKindOfClass:[NSArray class]]){
        NSArray * arr = (NSArray *)obj;
        return  arr.count == 0;
    }else if ([obj isKindOfClass:[NSDictionary class]]){
        NSDictionary * dict = (NSDictionary *)obj;
        return dict.allKeys.count == 0;
    }    return NO;
}

+(CGFloat)getContentPreciseWith:(UIView *)obj width:(CGFloat)width{
    CGSize labelSize = [obj sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return ceil(labelSize.height) + 1;
}

+ (CGFloat)getWidthWithString:(NSString *)string font:(UIFont *)font{
    CGSize constraint = CGSizeMake(MAXFLOAT,CGFLOAT_MAX);
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    CGSize size = [string boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading  attributes:dic context:nil].size;
    return ceilf(size.width);
}

+ (CGFloat)getHeightWithString:(NSString *)string width:(CGFloat)width font:(UIFont *)font{
    CGFloat height = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.height;
    if ([string isEqualToString:@"\n"]) {
        height += [self hasLineWithString:string]*font.lineHeight;
    }
    return ceilf(height);
}

+(NSString *)dateWithTimeInterval:(NSTimeInterval)timeInterval isAdot:(BOOL)isAdot{
    NSDate * d = [[NSDate alloc]initWithTimeIntervalSince1970:timeInterval/1000.0];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:isAdot ? @"yyyy.MM.dd" : @"yyyy-MM-dd"];
    NSString * timeString=[formatter stringFromDate:d];
    return timeString;
}


+ (NSUInteger)hasLineWithString:(NSString *)string{
    return [string componentsSeparatedByString:@"\n"].count;
}

+(BOOL )saveUserDefaultsWithKey:(NSString *)key value:(id)value{
    NSUserDefaults * df = [NSUserDefaults standardUserDefaults];
    [df setObject:value forKey:key];
    return [df synchronize];
}

+(id)getUserDefaultsWithKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void)removeUserDefaultsWithKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

+(CGFloat)safeAreaBottom{
    CGFloat safeAreaInsetBottom = 0.0;
    if (@available(iOS 11.0, *)) {
        UIWindow * mainWindow = [[[UIApplication sharedApplication] delegate] window];
        safeAreaInsetBottom = mainWindow.safeAreaInsets.bottom;
    }
    return safeAreaInsetBottom;
}

+ (UIImage *)compress:(UIImage *)image Scale:(float)scale {
    NSData *compressData = UIImageJPEGRepresentation(image, scale);
    UIImage *compressImg = [[UIImage alloc] initWithData:compressData];
    return [compressImg fixOrientation];
}

+ (UIImage *)redrawImage:(UIImage *)img Width:(NSInteger)width Height:(NSInteger)height{
    CGFloat imgWidth = img.scale * img.size.width;
    CGFloat imgHeight = img.scale * img.size.height;
    CGFloat scale = [[UIScreen mainScreen] scale];
    if (imgWidth > width*scale || imgHeight > height*scale) {
        CGFloat xScaleFactor = imgWidth / width;
        CGFloat yScaleFactor = imgHeight / height;
        CGFloat scaleFactor = xScaleFactor > yScaleFactor ? xScaleFactor : yScaleFactor;
        CGSize size = CGSizeMake(round(imgWidth/scaleFactor), round(imgHeight/scaleFactor));
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
        [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage *redrawImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return [redrawImg fixOrientation];
    }
    return [img fixOrientation];
}

@end
