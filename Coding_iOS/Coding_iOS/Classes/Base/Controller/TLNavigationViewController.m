//
//  TLNavigationViewController.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLNavigationViewController.h"
#import "TLBaseViewController.h"

@interface TLNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation TLNavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    self.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //[self setNavigationBarApperance];
}

- (void)setNavigationBarApperance
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:8 green:8 blue:8 alpha:1.0] size:CGSizeMake(10, 10)] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTintColor:[UIColor colorWithRed:59/255.0 green:189/255.0 blue:121/255.0 alpha:1.0]];//返回按钮的箭头颜色
    
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                                     NSForegroundColorAttributeName: [UIColor colorWithHexString:@"0x323A45"],
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

- (void)pushViewController:(TLBaseViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        backButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [backButton setTitleColor:[UIColor colorWithRed:59/255.0 green:189/255.0 blue:121/255.0 alpha:1.0] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        if([viewController isKindOfClass:[TLBaseViewController class]]){
            
            viewController.customerNavigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        }else{
            
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        }
    }
    
//    if(self.viewControllers.count > 0){
//
//        viewController.hidesBottomBarWhenPushed = YES;
//        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
//        [backButton setTitle:@"返回" forState:UIControlStateNormal];
//        backButton.titleLabel.font = [UIFont systemFontOfSize:14];
//        [backButton setTitleColor:[UIColor colorWithRed:59/255.0 green:189/255.0 blue:121/255.0 alpha:1.0] forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        [backButton sizeToFit];
//        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.viewControllers.count > 1;
}


@end
