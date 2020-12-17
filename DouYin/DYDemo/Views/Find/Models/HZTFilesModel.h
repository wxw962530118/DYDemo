//
//  HZTFilesModel.h
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZTFilesModel : NSObject
/**服务器url*/
@property (nonatomic,copy) NSString * url;
@property (nonatomic, assign) CGFloat picWidth;   //图片(视频)宽
@property (nonatomic, assign) CGFloat picHeight;  //图片(视频)高
@property (nonatomic,assign) CGFloat imageH;
@property (nonatomic, strong) NSString *type;  //文件类型(v,i)
@property (nonatomic, strong) NSString *oriFileName; //原文件路径(相对路径)
@property (nonatomic, strong) NSString *thumnailName; //略缩图文件路径(相对路径)
@property (nonatomic, strong) UIImage *thumnailImage; //略缩图
/**视频时长*/
@property (nonatomic,assign) long len;
/**是否为添加*/
@property (nonatomic,assign) BOOL isAdd;
+ (NSString *)hztNoteFilePath;
@end

NS_ASSUME_NONNULL_END
