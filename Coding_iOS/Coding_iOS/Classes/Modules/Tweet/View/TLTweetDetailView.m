//
//  TLTweetDetailView.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLTweetDetailView.h"
#import "TLTweetDetailViewFrame.h"
#import "TLTweetPhotosView.h"
#import "TLTweet.h"
#import "TLOwner.h"

@interface TLTweetDetailView()

@property (nonatomic, weak) UIImageView *headerIconView;

@property (nonatomic, weak) UILabel *nameLabel;

@property (nonatomic, weak) UILabel *timeLabel;

@property (nonatomic, weak) UILabel *contentLabel;

@property (nonatomic, weak) TLTweetPhotosView *tweetPhotosView;

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
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        TLTweetPhotosView *tweetPhotosView = [[TLTweetPhotosView alloc] init];
        tweetPhotosView.backgroundColor = [UIColor purpleColor];
        [self addSubview:tweetPhotosView];
        self.tweetPhotosView = tweetPhotosView;
    }
    return self;
}

- (void)setDetailFrame:(TLTweetDetailViewFrame *)detailFrame
{
    _detailFrame = detailFrame;
    
    self.frame = detailFrame.frame;
    
    // 取出冒泡数据
    TLTweet *tweet = detailFrame.tweet;
    // 取出用户数据
    TLOwner *owner = tweet.owner;
    
    // 1. 头像
    [self.headerIconView sd_setImageWithURL:[NSURL URLWithString:owner.avatar] placeholderImage:[UIImage originImageWithName:@"placeholder_monkey_round_40"]];
    self.headerIconView.frame = detailFrame.iconFrame;
    
    // 2. 昵称
    self.nameLabel.text = owner.name;
    self.nameLabel.frame = detailFrame.nameFrame;
    
    // 3. 发布时间
    NSDate *date = [tweet.created_at dateWithStr];
    NSString *time = [date createTimeWithDate];
    self.timeLabel.text = time;
    CGFloat timeX = CGRectGetMinX(self.nameLabel.frame);
    CGFloat timeY = CGRectGetMaxY(self.nameLabel.frame) + 15;
    CGSize timeSize = [time boundingRectWithSize:CGSizeMake(100, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil].size;
    self.timeLabel.frame = (CGRect){{timeX, timeY}, timeSize};
    
    // 4. 内容
    self.contentLabel.text = tweet.content;
    self.contentLabel.frame = detailFrame.contentFrame;
    
    // 5. 配图
    self.tweetPhotosView.frame = detailFrame.photosFrame;
    
}

@end
