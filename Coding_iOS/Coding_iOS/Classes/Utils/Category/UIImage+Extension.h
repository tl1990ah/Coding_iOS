//
//  UIImage+Extension.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/5/8.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据颜色生成一张图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  根据图片名称生成一张原始的图片，去掉系统的渲染
 */
+ (UIImage *)originImageWithName:(NSString *)imageName;

/**
 *  返回一张圆形图片
 */
- (instancetype)circleImage;

/**
 *  对原来的图片的大小进行处理
 */
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size;

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

/**
 *  将图片（UIImage对象）按指定的压缩率进行base64转码
 */
+ (NSString *)imageTranscodeWithImage:(UIImage *)image compressionQuality:(CGFloat)compressionQuality;

/**
 *  将图片（UIImage对象）直接转换成字符串
 */
+ (NSString *)imageTransToStringWithImage:(UIImage *)image;

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

- (UIImage *)croppedImageAtFrame:(CGRect)frame;

- (UIImage *)addImageToImage:(UIImage *)img atRect:(CGRect)cropRect;

- (UIImage *)applyLightEffectAtFrame:(CGRect)frame;

@end
