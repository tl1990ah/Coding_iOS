//
//  TLHttpTool.h
//  Kaledai
//
//  Created by taolei-mac on 2017/5/15.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLHttpTool : NSObject

/**
 *
 *  发送一个get请求
 @param url 请求路径
 @param params 请求参数
 @param success 请求成功后的回调 （请求成功后想做的事情写到这个block中）
 @param failure 请求失败后的回调  请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

/**
 *
 *  发送一个post请求
 @param url 请求路径
 @param params 请求参数
 @param success 请求成功后的回调 （请求成功后想做的事情写到这个block中）
 @param failure 请求失败后的回调  请求失败后想做的事情写到这个block中）
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

@end
