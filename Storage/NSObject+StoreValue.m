//
//  YKCenter+StoreValue.m
//  yidao
//
//  Created by 杨锴 on 2017/6/10.
//  Copyright © 2017年 yvkd. All rights reserved.
//

#import "NSObject+StoreValue.h"

@implementation NSObject (StoreValue)
-(void)storeValueWithKey:(NSString *)key{
    [[YKCenter share]storeValue:self withKey:key];
}
+(id)valueBykey:(NSString *)key{
    return  [[YKCenter share]valueWithKey:key];
}
@end
