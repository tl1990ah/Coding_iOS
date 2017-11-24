//
//  TLTweetDetailViewFrame.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/24.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLTweet;

@interface TLTweetDetailViewFrame : NSObject

@property (nonatomic, assign) CGRect iconFrame;

@property (nonatomic, assign) CGRect nameFrame;

@property (nonatomic, assign) CGRect timeFrame;

@property (nonatomic, assign) CGRect contentFrame;

@property (nonatomic, assign) CGRect photosFrame;

@property (nonatomic, assign) CGRect frame;

@property (nonatomic, strong) TLTweet *tweet;

@end
