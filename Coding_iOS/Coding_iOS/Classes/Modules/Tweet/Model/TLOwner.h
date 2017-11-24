//
//  TLOwner.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLOwner : NSObject

@property (nonatomic, assign) NSInteger job;

@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *company;

@property (nonatomic, copy) NSString *slogan;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *lavatar;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, copy) NSString *last_logined_at;

@property (nonatomic, copy) NSString *global_key;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *name_pinyin;

@property (nonatomic, copy) NSString *path;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger vip;

@property (nonatomic, assign) NSInteger follows_count;

@property (nonatomic, assign) NSInteger fans_count;

@property (nonatomic, assign) BOOL followed;

@property (nonatomic, assign) BOOL follow;

@end
