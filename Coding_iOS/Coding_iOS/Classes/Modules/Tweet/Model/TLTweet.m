//
//  TLTweet.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLTweet.h"
#import "TLComment.h"
#import "TLLikeUser.h"

@implementation TLTweet

- (NSDictionary *)objectClassInArray
{
    return @{@"comment_list" : [TLComment class], @"like_users" : [TLLikeUser class]};
}

@end
