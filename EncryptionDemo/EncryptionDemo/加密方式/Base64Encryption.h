//
//  Base64Encryption.h
//  EncryptionDemo
//
//  Created by tianmaotao on 2017/6/13.
//  Copyright © 2017年 tianmaotao. All rights reserved.
//
/**
 Base64简单说明
    描述：Base64可以成为密码学的基石，非常重要。
    特点：可以将任意的二进制数据进行Base64编码
    结果：所有的数据都能被编码为并只用65个字符就能表示的文本文件。
    65字符：A~Z a~z 0~9 + / =
    对文件进行base64编码后文件数据的变化：编码后的数据~=编码前数据的4/3，会大1/3左右。
 
 Base64编码原理
    1) 将所有字符转化为ASCII码；
    2) 将ASCII码转化为8位二进制；
    3) 将二进制3个归成一组(不足3个在后边补0)共24位，再拆分成4组，每组6位；
    4) 统一在6位二进制前补两个0凑足8位；
    5) 将补0后的二进制转为十进制；
    6) 从Base64编码表获取十进制对应的Base64编码；
 
 处理过程说明：
    a.转换的时候，将三个byte的数据，先后放入一个24bit的缓冲区中，先来的byte占高位。
    b.数据不足3byte的话，于缓冲区中剩下的bit用0补足。然后，每次取出6个bit，按照其值选择查表选择对应的字符作为编码后的输出。
    c.不断进行，直到全部输入数据转换完成。
    d.如果最后剩下两个输入数据，在编码结果后加1个“=”；
    e.如果最后剩下一个输入数据，编码结果后加2个“=”；
    f.如果没有剩下任何数据，就什么都不要加，这样才可以保证资料还原的正确性。
 */

#import <Foundation/Foundation.h>

@interface Base64Encryption : NSObject

/*给定一个字符串，对该字符串进行Base64编码，然后返回编码后的结果*/
+ (NSString *)base64EncodeString:(NSString *)string;

/*对base64编码后的字符串进行解码*/
+ (NSString *)base64DecodeString:(NSString *)string;

@end
