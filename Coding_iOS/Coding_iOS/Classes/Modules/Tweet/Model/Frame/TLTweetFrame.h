//
//  TLTweetFrame.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/24.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLTweetDetailViewFrame, TLCommentsFrame, TLTweet;

@interface TLTweetFrame : NSObject

@property (nonatomic, assign) CGRect toolBarFrame;

@property (nonatomic, strong) TLTweetDetailViewFrame *tweetDetailViewFrame;

@property (nonatomic, strong) TLCommentsFrame *commentsFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) TLTweet *tweet;

@end
