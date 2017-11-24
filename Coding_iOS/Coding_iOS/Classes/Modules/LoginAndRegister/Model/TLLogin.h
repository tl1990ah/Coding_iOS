//
//  TLLogin.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLLogin : NSObject

@property (nonatomic, copy) NSString *email, *password, *j_captcha;
@property (nonatomic, strong) NSNumber *remember_me;

@end
