//
//  TLMainViewController.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLMainViewController.h"
#import "TLNavigationViewController.h"
#import "TLProjectViewController.h"
#import "TLTaskViewController.h"
#import "TLTweetViewController.h"
#import "TLMessageViewController.h"
#import "TLMeViewController.h"

@interface TLMainViewController ()

@end

@implementation TLMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setupItemTitleTextAttributes];
    
    [self addAllChildViewControllers];
}

/**
 *  添加子控制器
 */
- (void)addAllChildViewControllers
{
    [self addOneChildViewController:[[TLNavigationViewController alloc] initWithRootViewController:[[TLProjectViewController alloc] init]] title:@"项目" image:@"project_normal" selectedImage:@"project_selected"];
    
    [self addOneChildViewController:[[TLNavigationViewController alloc] initWithRootViewController:[[TLTaskViewController alloc] init]] title:@"任务" image:@"task_normal" selectedImage:@"task_selected"];
    
    [self addOneChildViewController:[[TLNavigationViewController alloc] initWithRootViewController:[[TLTweetViewController alloc] init]] title:@"冒泡" image:@"tweet_normal" selectedImage:@"tweet_selected"];
    
    [self addOneChildViewController:[[TLNavigationViewController alloc] initWithRootViewController:[[TLMessageViewController alloc] init]] title:@"消息" image:@"privatemessage_normal" selectedImage:@"privatemessage_selected"];
    
    [self addOneChildViewController:[[TLNavigationViewController alloc] initWithRootViewController:[[TLMeViewController alloc] init]] title:@"我" image:@"me_normal" selectedImage:@"me_selected"];
}

- (void)setupItemTitleTextAttributes
{
    UITabBarItem *item = [UITabBarItem appearance];
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:59/255.0 green:189/255.0 blue:121/255.0 alpha:1.0];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc            子控制器
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中的图标
 */
- (void)addOneChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.tabBarItem.title = title;
    
    if(image.length){
        childVc.tabBarItem.image = [UIImage originImageWithName:image];
        childVc.tabBarItem.selectedImage = [UIImage originImageWithName:selectedImage];
    }
    [self addChildViewController:childVc];
}

@end
