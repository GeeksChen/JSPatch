//
//  AppDelegate+JSPatch.m
//  BEB
//
//  Created by Geeks_Chen on 2018/9/17.
//  Copyright © 2018年 Geeks_Chen. All rights reserved.
//

#import "AppDelegate+JSPatch.h"
#import "JPEngine.h"

@implementation AppDelegate (JSPatch)

- (void)configJSPatch{
    
    [JPEngine startEngine];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"hotfix" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
    
    /*
    //服务端js地址
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@/download/ios/patch/patch%@.js",BEBWebBaseUrl,app_build]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
     
        if (error) {
                NSLog(@"%@", error);
            } else {
                [JPEngine startEngine];
                NSString * script  =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                [JPEngine evaluateScript:script];
        }
     }];
     
    [dataTask resume];
    */
    
}

@end
