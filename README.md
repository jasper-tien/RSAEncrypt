# RSAEncrypt
该项目是关于RSA数据加密的demo。包括两部分：使用openssl生成的公钥'.der'文件加密和私钥 '.p12'文件解密；直接使用公钥字符串加密和私钥字符串解密。

# 说明
RSAEncryption.h和RSAEncryption.m文件为加密的工具文件。
## 使用说明
以下两个方法分别是过获取公钥和私钥的文件进行加密和解密。
```
/**
 *  加密方法
 *
 *  @param str          需要加密的字符串
 *  @param path         '.der'格式的公钥文件路径
 */

+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;
/**
 *  解密方法
 *
 *  @param  str         需要解密的字符串
 *  @param  path        '.p12'格式的私钥文件路径
 *  @param  password    私钥文件密码
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;
```
### 使用openssl生成所需加解密文件
生成环境是在mac系统下，使用openssl进行生成，首先打开终端，按下面这些步骤依次来做：
1. 生成模长为1024bit的私钥文件private_key.pem
```
openssl genrsa -out private_key.pem 1024
```
2. 生成证书请求文件rsaCertReq.csr
```
openssl req -new -key private_key.pem -out rsaCerReq.csr
```
注意：这一步会提示输入国家、省份、mail等信息，可以根据实际情况填写，或者全部不用填写，直接全部敲回车.

3. 生成证书rsaCert.crt，并设置有效时间为1年
```
openssl x509 -req -days 3650 -in rsaCerReq.csr -signkey private_key.pem -out rsaCert.crt
```
4. 生成供iOS使用的公钥文件public_key.der
```
openssl x509 -outform der -in rsaCert.crt -out public_key.der
```
5. 生成供iOS使用的私钥文件private_key.p12
```
openssl pkcs12 -export -out private_key.p12 -inkey private_key.pem -in rsaCert.crt
```
注意：这一步会提示给私钥文件设置密码，直接输入想要设置密码即可，然后敲回车，然后再验证刚才设置的密码，再次输入密码，然后敲回车，完毕！
在解密时，private_key.p12文件需要和这里设置的密码配合使用，因此需要牢记此密码.


以下两个方法分别是通过公钥和私钥字符串加解密的。
```
/**
 *  加密方法
 *
 *  @param  str         需要加密的字符串
 *  @param  pubKey      公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
/**
 *  解密方法
 *
 *  @param  str         需要解密的字符串
 *  @param  privKey     私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
```

### 公钥匙字符串和私钥字符串可以在以下网站获取：
http://web.chacuo.net/netrsakeypair


# 声明
内容整理自：
[iOS中使用RSA加密](http://www.jianshu.com/p/74a796ec5038)
