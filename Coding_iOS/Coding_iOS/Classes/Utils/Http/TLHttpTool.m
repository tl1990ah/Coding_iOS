//
//  TLHttpTool.m
//  Kaledai
//
//  Created by taolei-mac on 2017/5/15.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "TLHttpTool.h"
#import <AFNetworking.h>

@implementation TLHttpTool

+ (AFHTTPSessionManager *)createManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 30.0;
    NSHTTPCookie *_CSRF = nil;
    for (NSHTTPCookie *tempC in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]) {
        if ([tempC.name isEqualToString:@"XSRF-TOKEN"]) {
            _CSRF = tempC;
        }
    }
    if (_CSRF) {
        [manager.requestSerializer setValue:_CSRF.value forHTTPHeaderField:@"X-XSRF-TOKEN"];
    }
    return manager;
}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{

    // 2. 发送get请求
    [[self createManager] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if(success){
            success(responseObject);
            NSString *resultCode = [responseObject objectForKey:@"resultCode"];
            if([resultCode isEqualToString:@"401"]){
                
               
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if(failure){
            failure(error);
        }
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1. 获取请求管理者
    //url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // 2. 发送post请求
    [[self createManager] POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if(success){
            success(responseObject);
            NSString *resultCode = [responseObject objectForKey:@"resultCode"];
            if([resultCode isEqualToString:@"401"]){
                
              
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if(failure){
            failure(error);
        }
    }];
}

@end
