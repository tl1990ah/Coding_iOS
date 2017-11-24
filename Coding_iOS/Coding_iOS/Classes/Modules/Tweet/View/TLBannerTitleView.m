//
//  TLBannerTitleView.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLBannerTitleView.h"
#import "TLBanner.h"

@interface TLBannerTitleView()

@property (nonatomic, weak) UIButton *nameButton;

@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation TLBannerTitleView

- (void)setBanner:(TLBanner *)banner
{
    _banner = banner;
    
    [_nameButton setTitle:banner.name forState:UIControlStateNormal];
    [_nameButton.titleLabel sizeToFit];
    _nameButton.frame = CGRectMake(25, 10, _nameButton.titleLabel.width + 20, 20);
    
    _contentLabel.text = banner.title;
    [_contentLabel sizeToFit];
    _contentLabel.frame = CGRectMake(CGRectGetMaxX(_nameButton.frame) + 15, 10, _contentLabel.width, 20);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews
{
    UIButton *nameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nameButton.titleLabel.font = [UIFont systemFontOfSize:9];
    [nameButton setTitleColor:TLColor(200, 203, 208, 1.0) forState:UIControlStateNormal];
    nameButton.layer.borderWidth = 0.5;
    nameButton.layer.borderColor = TLColor(200, 203, 208, 1.0).CGColor;
    [self addSubview:nameButton];
    self.nameButton = nameButton;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.textColor = TLColor(108, 120, 133, 1.0);
    contentLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
}

@end
