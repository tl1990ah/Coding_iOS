//
//  TLCommentsView.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLCommentsView.h"
#import "TLCommentsFrame.h"

@interface TLCommentsView()

@property (nonatomic, weak) UIView *listView;

@end

@implementation TLCommentsView

- (void)setCommentsFrame:(TLCommentsFrame *)commentsFrame
{
    _commentsFrame = commentsFrame;
    
    self.frame = commentsFrame.frame;
    
    self.listView.frame = commentsFrame.commentsFrame;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        UIView *listView = [[UIView alloc] init];
        listView.backgroundColor = [UIColor orangeColor];
        [self addSubview:listView];
        self.listView = listView;
    }
    return self;
}

@end
