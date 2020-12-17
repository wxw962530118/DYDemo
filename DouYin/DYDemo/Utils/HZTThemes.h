//
//  HZTThemes.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef UIColorHex
#define UIColorHex(_hex_)   [HZTThemes colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

@interface HZTThemes : NSObject
+ (UIImage *)getImage:(NSString *)name;
+ (UIColor *)colorWithHexString:(NSString *)hexStr;
@end

