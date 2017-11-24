//
//  TLTweetViewController.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLTweetViewController.h"
#import "TLTweetSquareViewController.h"
#import "TLMomentsViewController.h"
#import "TLHotTweetViewController.h"
#import "TLHttpTool.h"

@interface TLTweetViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *childVcScrollView;

@end

@implementation TLTweetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addAllChildVcs];
    
    [self addContentScrollView];
   
    [self addSubViews];
    
//    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:1];
//    params[@"sort"] = @"time";
//
//    [TLHttpTool get:@"https://coding.net/api/tweet/public_tweets" params:params success:^(id responseObj) {
//
//
//        TLLog(@"%@", responseObj);
//    } failure:^(NSError *error) {
//
//
//    }];
}


/**
 *  添加所有的子控制器
 */
- (void)addAllChildVcs
{
    TLTweetSquareViewController *tweetSquareVc = [[TLTweetSquareViewController alloc] init];
    [self addChildViewController:tweetSquareVc];
    
    TLMomentsViewController *momentsVc = [[TLMomentsViewController alloc] init];
    [self addChildViewController:momentsVc];
    
    TLHotTweetViewController *hotTweetVc = [[TLHotTweetViewController alloc] init];
    [self addChildViewController:hotTweetVc];
}

- (void)addContentScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *childVcScrollView = [[UIScrollView alloc] init];
    childVcScrollView.frame = self.view.frame;
    childVcScrollView.pagingEnabled = YES;
    childVcScrollView.delegate = self;
    childVcScrollView.showsVerticalScrollIndicator = NO;
    childVcScrollView.showsHorizontalScrollIndicator = NO;
    childVcScrollView.contentSize = CGSizeMake(self.childViewControllers.count * TLScreenW, 0);
    [self.view addSubview:childVcScrollView];
    self.childVcScrollView = childVcScrollView;
    
    [self scrollViewDidEndScrollingAnimation:self.childVcScrollView];
}

- (void)addSubViews
{
    self.title = @"冒泡";
    
    self.customerNavigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"hot_topic_Nav" highImageName:@"hot_topic_Nav" target:self action:@selector(jumpToTopic)];
    
    self.customerNavigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"tweetBtn_Nav" highImageName:@"tweetBtn_Nav" target:self action:@selector(sendTweets)];
}

- (void)jumpToTopic
{
    TLLog(@"%s", __func__);
}

- (void)sendTweets
{
    TLLog(@"%s", __func__);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    UIViewController *childVc = self.childViewControllers[index];
    if(childVc.isViewLoaded){
        return;
    }
    
    childVc.view.frame = scrollView.bounds;
    [scrollView addSubview:childVc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

@end
