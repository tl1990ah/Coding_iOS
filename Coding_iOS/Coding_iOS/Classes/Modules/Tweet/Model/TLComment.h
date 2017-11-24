//
//  TLComment.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLOwner;

@interface TLComment : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger tweet_id;

@property (nonatomic, assign) NSInteger owner_id;

@property (nonatomic, strong) TLOwner *owner;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger created_at;

@end
