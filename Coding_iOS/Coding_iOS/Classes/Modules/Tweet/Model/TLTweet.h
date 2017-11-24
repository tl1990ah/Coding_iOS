//
//  TLTweet.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLOwner;

@interface TLTweet : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger owner_id;

@property (nonatomic, strong) TLOwner *owner;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, assign) NSInteger sort_time;

@property (nonatomic, assign) NSInteger likes;

@property (nonatomic, assign) NSInteger rewards;

@property (nonatomic, assign) NSInteger comments;

@property (nonatomic, strong) NSArray *comment_list;

@property (nonatomic, copy) NSString *device;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *coord;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger activity_id;

@property (nonatomic, assign) BOOL liked;

@property (nonatomic, strong) NSArray *like_users;

@property (nonatomic, strong) NSArray *reward_users;

@property (nonatomic, assign) BOOL rewarded;

@end
