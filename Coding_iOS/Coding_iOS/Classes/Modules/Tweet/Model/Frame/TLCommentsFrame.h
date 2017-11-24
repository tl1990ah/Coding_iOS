//
//  TLCommentsFrame.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/24.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLTweet;

@interface TLCommentsFrame : NSObject

@property (nonatomic, strong) TLTweet *tweet;

@property (nonatomic, assign) CGRect commentsFrame;

@property (nonatomic, assign) CGRect frame;

@end
