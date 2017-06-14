//
//  Base64Encryption.m
//  EncryptionDemo
//
//  Created by tianmaotao on 2017/6/13.
//  Copyright © 2017年 tianmaotao. All rights reserved.
//

#import "Base64Encryption.h"

@implementation Base64Encryption

+ (NSString *)base64EncodeString:(NSString *)string {
    if (!string || [string isEqualToString:@""] || ![string isKindOfClass:[NSString class]]) {
        return @"";
    }
    
    //把字符串转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //对二进制数据进行base64编码
    //这是苹果已经给我们提供的方法
    return [data base64EncodedStringWithOptions:0];
}

+ (NSString *)base64DecodeString:(NSString *)string {
    if (!string || [string isEqualToString:@""] || ![string isKindOfClass:[NSString class]]) {
        return @"";
    }
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    
    //把二进制数据转换为字符串返回
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
