//
//  TLBaseViewController.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLNavigationBar;

@interface TLBaseViewController : UIViewController
/** 自定义导航栏 */
@property (nonatomic, strong) TLNavigationBar *navBar;
/** 自定义导航栏栏目 */
@property (nonatomic, strong) UINavigationItem *customerNavigationItem;
/** 导航栏背景色  iOS7.0之后 */
@property (nonatomic, strong) UIColor *navBarTintColor;
/** 导航栏背景图片颜色 */
@property (nonatomic, strong) UIColor *navBackgroundColor;
/** 导航栏背景图 */
@property (nonatomic, strong) UIImage *navBackgroundImage;
/** 导航栏背景色  iOS7.0之前 */
@property (nonatomic, strong) UIColor *navTintColor;
/** 导航栏中间标题控件 */
@property (nonatomic, strong) UIView *navTitleView;
/** 导航栏中间标题字体颜色 */
@property (nonatomic, strong) UIColor *navTitleColor;
/** 导航栏中间标题字体 */
@property (nonatomic, strong) UIFont *navTitleFont;
/** 导航栏左边的item */
@property (nonatomic, strong) UIBarButtonItem *navLeftBarButtonItem;
/** 导航栏右边的item */
@property (nonatomic, strong) UIBarButtonItem *navRightBarButtonItem;
/** 导航栏的透明度 */
@property (nonatomic, assign) CGFloat navBarAlpha;

@property (nonatomic, assign) BOOL hide;

@end
