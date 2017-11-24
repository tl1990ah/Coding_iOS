//
//  TLComment.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLComment.h"

@implementation TLComment

+ (void)load
{
    [TLComment mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{@"Id" : @"id"};
    }];
}

@end
