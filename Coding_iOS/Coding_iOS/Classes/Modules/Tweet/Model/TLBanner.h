//
//  TLBanner.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLBanner : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, copy) NSString *updated_at;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger sort;

@property (nonatomic, assign) NSInteger Id;

@end
