//
//  TLNavigationBar.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLNavigationBar.h"

@implementation TLNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *subView in self.subviews) {
        
        if([NSStringFromClass([subView class]) containsString:@"Background"]) {
            subView.frame = self.bounds;
        }
        else if ([NSStringFromClass([subView class]) containsString:@"ContentView"]) {
            CGRect frame = subView.frame;
            frame.origin.y = 20;
            frame.size.height = self.bounds.size.height - frame.origin.y;
            subView.frame = frame;
        }
    }
}

@end
