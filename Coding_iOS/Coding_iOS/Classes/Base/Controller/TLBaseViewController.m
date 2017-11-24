//
//  TLBaseViewController.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLBaseViewController.h"
#import "TLNavigationBar.h"

@interface TLBaseViewController ()

@end

@implementation TLBaseViewController

- (TLNavigationBar *)navBar
{
    if(_navBar == nil){
        
        _navBar = [[TLNavigationBar alloc] initWithFrame:CGRectMake(0, 0, TLScreenW, TLNavigationBarH)];
    }
    return _navBar;
}

- (UINavigationItem *)customerNavigationItem
{
    if (!_customerNavigationItem) {
        _customerNavigationItem = [UINavigationItem new];
    }
    return _customerNavigationItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(self.navBar && !self.navBar.hidden){
        
        [self.view bringSubviewToFront:self.navBar];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCustomNavBar];
    
}

/**
 *  设置自定义导航栏
 */
- (void)setupCustomNavBar
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.navBar];
    
    self.navBar.translucent = NO;
    
    self.navBar.items = @[self.customerNavigationItem];
    
    self.navBackgroundImage = [UIImage createImageWithColor:[UIColor colorWithRed:8 green:8 blue:8 alpha:1.0] size:CGSizeMake(10, 10)];
    
    self.navTitleColor = [UIColor colorWithHexString:@"0x323A45"];
}

- (void)setHide:(BOOL)hide
{
    _hide = hide;
    
    self.navBar.hidden = hide;
}

- (void)setNavBackgroundImage:(UIImage *)navBackgroundImage
{
    _navBackgroundImage = navBackgroundImage;
    
    [self.navBar setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    //[self.navBar setShadowImage:[UIImage new]];
}

- (void)setNavBarAlpha:(CGFloat)navBarAlpha
{
    _navBarAlpha = navBarAlpha;
    
    UIView *barBackgroundView = self.navBar.subviews.firstObject;
    barBackgroundView.alpha = navBarAlpha;
}

- (void)setTitle:(NSString *)title
{
    self.customerNavigationItem.title = title;
}

- (void)setNavTitleColor:(UIColor *)navTitleColor
{
    _navTitleColor = navTitleColor;
    
    UIFont *titleFont = self.navTitleFont ? self.navTitleFont : [UIFont systemFontOfSize:18];
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName: navTitleColor, NSFontAttributeName: titleFont};
}

- (void)setNavTitleFont:(UIFont *)navTitleFont
{
    _navTitleFont = navTitleFont;
    
    UIColor *navTitleColor = self.navTitleColor ? self.navTitleColor : [UIColor whiteColor];
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName: navTitleColor, NSFontAttributeName: navTitleFont};
}

- (void)setNavLeftBarButtonItem:(UIBarButtonItem *)navLeftBarButtonItem
{
    _navLeftBarButtonItem = navLeftBarButtonItem;
    
    self.customerNavigationItem.leftBarButtonItem = navLeftBarButtonItem;
}

- (void)setNavRightBarButtonItem:(UIBarButtonItem *)navRightBarButtonItem
{
    _navRightBarButtonItem = navRightBarButtonItem;
    
    self.customerNavigationItem.rightBarButtonItem = navRightBarButtonItem;
}

@end
