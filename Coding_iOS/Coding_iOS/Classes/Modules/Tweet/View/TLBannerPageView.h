//
//  TLBannerPageView.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLBanner;

@interface TLBannerPageView : UIView

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) TLBanner *banner;

@end
