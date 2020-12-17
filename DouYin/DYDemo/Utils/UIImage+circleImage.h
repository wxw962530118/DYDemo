//
//  UIImage+circleImage.h
//  ClipImageTestDemo
//
//  Created by haizitong4 on 16/4/8.
//  Copyright © 2016年 Ronin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (circleImage)
/**
 *  图片裁剪
 *
 *  @return 裁剪后的图片
 */
- (UIImage *)circleImage;
- (UIImage *)circleImageWithPoint:(CGPoint)point;
/**
 *  根据缩放图片到目标Size
 *
 *  @param targetSize 目标Size
 *
 *  @return 缩放后的图片
 */
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
/**
 *  图片旋转
 *
 *  @return 向上图片
 */
- (UIImage *)fixOrientation;
/**
 *  图片压缩
 *
 *  @return 压缩图片
 */
- (UIImage *)uploadCompressed;

- (UIImage *)createRoundedWithRadius:(CGFloat)radius;

- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
@end
