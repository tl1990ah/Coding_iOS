//
//  TLDefine.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#ifndef TLDefine_h
#define TLDefine_h

#define TLAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

// 系统版本

#define iOS7_OR_LATER NLSystemVersionGreaterOrEqualThan(7.0)
#define iOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define SYSTEM_VERSION [[UIDevice currentDevice].systemVersion doubleValue]
#define iOS7 ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0 && ([[[UIDevice currentDevice]systemVersion] floatValue] < 8.0))
#define iOS8 (([[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0) && ([[[UIDevice currentDevice]systemVersion] floatValue] < 9.0))
#define iOS9 (([[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0) && ([[[UIDevice currentDevice]systemVersion] floatValue] < 10.0))
#define iOS10 (([[[UIDevice currentDevice]systemVersion] floatValue] >= 10.0) && ([[[UIDevice currentDevice]systemVersion] floatValue] < 11.0))
#define iOS11 (([[[UIDevice currentDevice]systemVersion] floatValue] >= 11.0) && ([[[UIDevice currentDevice]systemVersion] floatValue] < 12.0))

#ifdef DEBUG // 调试状态，打开LOG功能
#define TLLog(...) NSLog(__VA_ARGS__)
#else  // 发布状态，关闭LOG功能
#define TLLog(...)
#endif

// 屏幕尺寸
#define TLScreenW  [UIScreen mainScreen].bounds.size.width
#define TLScreenH  [UIScreen mainScreen].bounds.size.height

// 颜色
#define TLColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 随机色
#define TLRandomColor TLColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)

#define TLTitleViewH 44.0

// 导航栏高度
#define TLNavigationBarH 64.0
// 标签栏高度
#define TLTabBarH 49.0

#endif /* TLDefine_h */
