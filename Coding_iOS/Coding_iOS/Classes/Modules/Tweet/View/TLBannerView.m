//
//  TLBannerView.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLBannerView.h"
#import "TLBannerPageView.h"
#import "TLBanner.h"

@interface TLBannerView()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) TLBannerPageView *bannerPageView;

@end

@implementation TLBannerView

- (void)setDatas:(NSArray *)datas
{
    _datas = datas;
    
    _bannerPageView.count = datas.count;
    _bannerPageView.banner = datas.firstObject;
    
    _scrollView.contentSize = CGSizeMake(TLScreenW * datas.count, 0);
    for (int i = 0; i < datas.count; i++) {
        
        TLBanner *banner = datas[i];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * _scrollView.width, 0, _scrollView.width, _scrollView.height);
        [_scrollView addSubview:imageView];
        [imageView sd_setImageWithURL:[NSURL URLWithString:banner.image] placeholderImage:nil];
    }
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
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.frame = CGRectMake(0, 0, TLScreenW, 140);
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    TLBannerPageView *bannerPageView = [[TLBannerPageView alloc] init];
    bannerPageView.backgroundColor = [UIColor whiteColor];
    bannerPageView.frame = CGRectMake(0, CGRectGetMaxY(scrollView.frame), TLScreenW, 40);
    [self addSubview:bannerPageView];
    self.bannerPageView = bannerPageView;
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    int index = offsetX / self.frame.size.width;
    _bannerPageView.currentIndex = index;
    _bannerPageView.banner = self.datas[index];
}

@end
