//
//  TLTweetFrame.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/24.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLTweetFrame.h"
#import "TLTweetDetailViewFrame.h"
#import "TLCommentsFrame.h"

@implementation TLTweetFrame

- (void)setTweet:(TLTweet *)tweet
{
    _tweet = tweet;
    
    TLTweetDetailViewFrame *detailViewFrame = [[TLTweetDetailViewFrame alloc] init];
    detailViewFrame.tweet = tweet;
    self.tweetDetailViewFrame = detailViewFrame;
    
    TLCommentsFrame *commentsFrame = [[TLCommentsFrame alloc] init];
    commentsFrame.tweet = tweet;
    CGRect originFrame = commentsFrame.frame;
    originFrame.origin.y = CGRectGetMaxY(detailViewFrame.frame);
    commentsFrame.frame = originFrame;
    self.commentsFrame = commentsFrame;
    
    self.cellHeight = CGRectGetMaxY(self.commentsFrame.frame) + 10;
}

@end
