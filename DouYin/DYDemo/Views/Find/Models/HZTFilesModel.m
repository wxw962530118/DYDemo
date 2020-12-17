//
//  HZTFilesModel.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFilesModel.h"

@implementation HZTFilesModel
+ (NSString *)hztNoteFilePath {
    NSString * path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    if (!path) return nil;
    NSString *directory = [path stringByAppendingPathComponent:@"HZTNoteFile"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:directory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return directory;
}

@end
