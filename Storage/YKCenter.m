//
//  YKCenter.m
//  yidao
//
//  Created by 杨锴 on 2017/6/10.
//  Copyright © 2017年 yvkd. All rights reserved.
//

#import "YKCenter.h"
#import "FastCoder.h"
static YKCenter *center =nil;

@implementation YKCenter
+(instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = (YKCenter *)@"YKCenter"; //这是严格的单例模式书写
        center = [[YKCenter alloc]init];
    });
    //防止子类使用
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"YKCenter"] == NO) {
        NSParameterAssert(nil);
    }
    return center;
}
-(instancetype)init{
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"YKCenter"]) {
        self = [super init];
        if (self) {
        }
        return self;
    }else{
        return nil;
    }
}
-(void)storeValue:(id)value withKey:(NSString *)key{
    NSParameterAssert(value); //如果为空，将会报错。
    NSParameterAssert(key);
    NSData *data= [FastCoder dataWithRootObject:value];//FastCoder 的内容
    if (data) {
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:key];
    }
}
-(id)valueWithKey:(NSString *)key{
    NSParameterAssert(key);
    NSData *data = [[NSUserDefaults standardUserDefaults]valueForKey:key];
    return [FastCoder objectWithData:data];
}
@end
