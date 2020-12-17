//
//  HZTFindListModel.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindListModel.h"

@implementation HZTFindListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"files" : HZTMediaFileModel.class
    };
}
@end
