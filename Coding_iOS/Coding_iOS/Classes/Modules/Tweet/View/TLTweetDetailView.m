//
//  TLTweetDetailView.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLTweetDetailView.h"

@interface TLTweetDetailView()

@property (nonatomic, weak) UIImageView *headerIconView;

@property (nonatomic, weak) UILabel *nameLabel;

@property (nonatomic, weak) UILabel *timeLabel;

@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation TLTweetDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        UIImageView *headerIconView = [[UIImageView alloc] init];
        [self addSubview:headerIconView];
        self.headerIconView = headerIconView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.textColor = TLColor(153, 161, 170, 1.0);
        timeLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
    }
    return self;
}

@end
