//
//  TLTweetCell.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLTweetCell.h"
#import "TLTweetDetailView.h"
#import "TLCommentsView.h"

@interface TLTweetCell()

@property (nonatomic, weak) TLTweetDetailView *tweetDetailView;

@property (nonatomic, weak) TLCommentsView *commentsView;

@end

@implementation TLTweetCell

+ (instancetype)createTweetCellWithTableView:(UITableView *)tableView
{
    static NSString *Id = @"tweet";
    TLTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if(!cell){
        
        cell = [[TLTweetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        // 1. 添加冒泡详情
        TLTweetDetailView *tweetDetailView = [[TLTweetDetailView alloc] init];
        tweetDetailView.frame = CGRectMake(0, 0, TLScreenW, 120);
        tweetDetailView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:tweetDetailView];
        self.tweetDetailView = tweetDetailView;
        
        // 2. 添加评论
        TLCommentsView *commentsView = [[TLCommentsView alloc] init];
        commentsView.backgroundColor = [UIColor purpleColor];
        commentsView.frame = CGRectMake(0, 120, TLScreenW, 80);
        [self.contentView addSubview:commentsView];
        self.commentsView = commentsView;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}



@end
