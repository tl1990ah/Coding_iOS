//
//  UIBarButtonItem+Extension.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/5/8.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  根据标题创建一个BarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

/**
 *  根据图标创建一个BarButtonItem
 */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName imageEdge:(UIEdgeInsets)imageEdge target:(id)target action:(SEL)action;

@end
