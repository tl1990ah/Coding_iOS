//
//  TLTweetDetailViewFrame.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/24.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLTweetDetailViewFrame.h"
#import "TLTweet.h"
#import "TLOwner.h"

@implementation TLTweetDetailViewFrame

- (void)setTweet:(TLTweet *)tweet
{
    _tweet = tweet;
    
    // 1. 头像
    CGFloat iconX = 20.0;
    CGFloat iconY = 20.0;
    CGFloat iconW = 45.0;
    CGFloat iconH = 45.0;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2. 昵称
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + 20.0;
    CGFloat nameY = 25.0;
    CGFloat height = [tweet.owner.name boundingRectWithSize:CGSizeMake(100, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height;
    self.nameFrame = CGRectMake(nameX, nameY, 100, height);
    
    // 3. 时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameFrame) + 15;
    CGFloat height2 = [tweet.time boundingRectWithSize:CGSizeMake(100, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil].size.height;
    self.timeFrame = CGRectMake(timeX, timeY, 100, height2);
    
    // 4. 内容
    CGFloat contentX = iconX;
    CGFloat contentY = CGRectGetMaxY(self.timeFrame) + 15;
    CGFloat height3 = [tweet.content boundingRectWithSize:CGSizeMake(TLScreenW - 2 * nameX, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height;
    self.contentFrame = CGRectMake(contentX, contentY, TLScreenW - 2 *nameX, height3);
    
    self.photosFrame = CGRectMake(contentX, CGRectGetMaxY(self.contentFrame) + 10, TLScreenW - 2 * nameX, 100);
    
    self.frame = CGRectMake(0, 0, TLScreenW, CGRectGetMaxY(self.photosFrame));
}

@end
