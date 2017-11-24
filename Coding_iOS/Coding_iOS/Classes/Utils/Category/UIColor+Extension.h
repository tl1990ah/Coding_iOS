//
//  UIColor+Extension.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/5/8.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  根据16进制生成一个UIColor对象
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex;

/**
 *  根据字符串进制生成一个UIColor对象（比如 @"0xdedede"）
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
