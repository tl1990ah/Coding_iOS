//
//  TLCommentsFrame.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/24.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLCommentsFrame.h"
#import "TLTweet.h"

@interface TLCommentsFrame()

@property (nonatomic, weak) UIView *commentList;

@end

@implementation TLCommentsFrame

- (void)setTweet:(TLTweet *)tweet
{
    _tweet = tweet;
    
    self.commentsFrame = CGRectMake(20, 5, TLScreenW - 40, 200);
    
    self.frame = CGRectMake(0, 0, TLScreenW, CGRectGetMaxY(self.commentsFrame) + 10);
}

@end
