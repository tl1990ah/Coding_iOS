//
//  TLBannerPageView.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLBannerPageView.h"
#import "TLBannerTitleView.h"
#import "TLBanner.h"

@interface TLBannerPageView()

@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic ,weak) TLBannerTitleView *titleView;

@end

@implementation TLBannerPageView

- (void)setBanner:(TLBanner *)banner
{
    _banner = banner;
    
    _titleView.banner = banner;
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    
    _pageControl.currentPage = currentIndex;
}

- (void)setCount:(NSInteger )count
{
    _count = count;
    
    _pageControl.numberOfPages = count;
    _pageControl.currentPage = 0;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    [pageControl setValue:[UIImage imageNamed:@"home_banner_down"] forKeyPath:@"_currentPageImage"];
    [pageControl setValue:[UIImage imageNamed:@"home_banner_normal"] forKeyPath:@"_pageImage"];
    pageControl.frame = CGRectMake(140, 10, 30, 20);
    [self addSubview:pageControl];
    self.pageControl = pageControl;
    
    TLBannerTitleView *titleView = [[TLBannerTitleView alloc] init];
    titleView.frame = CGRectMake(0, 0, 200, 40);
    [self addSubview:titleView];
    self.titleView = titleView;
}

@end
