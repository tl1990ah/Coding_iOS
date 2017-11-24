//
//  TLBaseTweetViewController.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLBaseTweetViewController.h"
#import "TLBannerView.h"
#import "TLTweetCell.h"
#import "TLHttpTool.h"
#import "TLBanner.h"

@interface TLBaseTweetViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tweetListView;

@property (nonatomic, weak) TLBannerView *bannerView;

@end

@implementation TLBaseTweetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViews];
    
    [self getBanners];
}

- (void)addSubViews
{
    UITableView *tweetListView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tweetListView.backgroundColor = TLColor(242, 244, 246, 1.0);
    if(iOS11){
        tweetListView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    tweetListView.contentInset = UIEdgeInsetsMake(TLNavigationBarH, 0, TLTabBarH, 0);
    tweetListView.delegate = self;
    tweetListView.dataSource = self;
    tweetListView.rowHeight = 220;
    tweetListView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tweetListView];
    self.tweetListView = tweetListView;
    
    TLBannerView *bannerView = [[TLBannerView alloc] init];
    tweetListView.tableHeaderView = bannerView;
    bannerView.height = 200.0;
    self.bannerView = bannerView;
}

/**
 *  获取轮播图数据
 */
- (void)getBanners
{
    [TLHttpTool get:@"https://coding.net/api/banner/type/app" params:nil success:^(id responseObj) {
        
        NSArray *dicts = [responseObj objectForKey:@"data"];
        NSArray *banners = [TLBanner mj_objectArrayWithKeyValuesArray:dicts];
        self.bannerView.datas = [NSArray arrayWithArray:banners];
    } failure:^(NSError *error) {
        
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLTweetCell *cell = [TLTweetCell createTweetCellWithTableView:tableView];
    
    return cell;
}

@end
