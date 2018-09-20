# JSPatch

1、cocopods导入JSPatch
```
chenxiaodeMacBook-Pro% cd /Users/chenxiao/Desktop/respository/JSPatch
chenxiaodeMacBook-Pro% pod init
chenxiaodeMacBook-Pro% pod install
Analyzing dependencies
Downloading dependencies
Installing JSPatch (1.1.3)
Generating Pods project
Integrating client project
```

2、创建AppDelegate+JSPatch文件

AppDelegate+JSPatch.h

```
- (void)configJSPatch;

```
AppDelegate+JSPatch.m

```
- (void)configJSPatch{

    [JPEngine startEngine];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"hotfix" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];

}
```

说明：
本地测试
```
[JPEngine startEngine];
NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"hotfix" ofType:@"js"];
NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
[JPEngine evaluateScript:script];
```

服务端配置
```
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
```

>注意：开发测试时，主要操作本地JS文件，测试ok，把JS文件上传服务端，修复线上bug

常用JSPatch实例，参考简书：https://www.jianshu.com/p/74ead5e6020c

