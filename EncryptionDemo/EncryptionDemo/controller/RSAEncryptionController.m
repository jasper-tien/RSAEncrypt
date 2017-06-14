//
//  RSAEncryptionController.m
//  EncryptionDemo
//
//  Created by tianmaotao on 2017/6/13.
//  Copyright © 2017年 tianmaotao. All rights reserved.
//

#import "RSAEncryptionController.h"
#import "RSAEncryption.h"

@interface RSAEncryptionController ()
@property (weak, nonatomic) IBOutlet UITextField *sourceTextField;
@property (weak, nonatomic) IBOutlet UITextView *encodeTextView;
@property (weak, nonatomic) IBOutlet UITextView *decodeTextView;

@end

@implementation RSAEncryptionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)publicFileEncode:(id)sender {
    if ([_sourceTextField.text isEqualToString:@""]) {
        return;
    }
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    
    NSString *encodeStr = [RSAEncryption encryptString:_sourceTextField.text publicKeyWithContentsOfFile:public_key_path];
    
    _encodeTextView.text = encodeStr;
}

- (IBAction)privateFileDecode:(id)sender {
    if ([_encodeTextView.text isEqualToString:@""]) {
        return;
    }
    
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    NSString *password = @"tmthd19940404";
    NSString *decodeStr = [RSAEncryption decryptString:_encodeTextView.text privateKeyWithContentsOfFile:private_key_path password:password];
    
    _decodeTextView.text = decodeStr;
}


/**
 pablicKey & privateKey从一下网站获取：
 http://web.chacuo.net/netrsakeypair
 这是一个在线生成RSA秘钥的网站, 生成公钥和秘钥后
 */
- (IBAction)publicStringEncode:(id)sender {
    if ([_sourceTextField.text isEqualToString:@""]) {
        return;
    }
    
    NSString *pulicKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDTbZ6cNH9PgdF60aQKveLz3FTalyzHQwbp601y77SzmGHX3F5NoVUZbdK7UMdoCLK4FBziTewYD9DWvAErXZo9BFuI96bAop8wfl1VkZyyHTcznxNJFGSQd/B70/ExMgMBpEwkAAdyUqIjIdVGh1FQK/4acwS39YXwbS+IlHsPSQIDAQAB";
    NSString *str = [RSAEncryption encryptString:_sourceTextField.text publicKey:pulicKey];
    _encodeTextView.text = str;
}
- (IBAction)privateStringDecode:(id)sender {
    if ([_encodeTextView.text isEqualToString:@""]) {
        return;
    }
    
    NSString *privateKey = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANNtnpw0f0+B0XrRpAq94vPcVNqXLMdDBunrTXLvtLOYYdfcXk2hVRlt0rtQx2gIsrgUHOJN7BgP0Na8AStdmj0EW4j3psCinzB+XVWRnLIdNzOfE0kUZJB38HvT8TEyAwGkTCQAB3JSoiMh1UaHUVAr/hpzBLf1hfBtL4iUew9JAgMBAAECgYA1tGeQmAkqofga8XtwuxEWDoaDS9k0+EKeUoXGxzqoT/GyiihuIafjILFhoUA1ndf/yCQaG973sbTDhtfpMwqFNQq13+JAownslTjWgr7Hwf7qplYW92R7CU0v7wFfjqm1t/2FKU9JkHfaHfb7qqESMIbO/VMjER9o4tEx58uXDQJBAO0O4lnWDVjr1gN02cqvxPOtTY6DgFbQDeaAZF8obb6XqvCqGW/AVms3Bh8nVlUwdQ2K/xte8tHxjW9FtBQTLd8CQQDkUncO35gAqUF9Bhsdzrs7nO1J3VjLrM0ITrepqjqtVEvdXZc+1/UrkWVaIigWAXjQCVfmQzScdbznhYXPz5fXAkEAgB3KMRkhL4yNpmKRjhw+ih+ASeRCCSj6Sjfbhx4XaakYZmbXxnChg+JB+bZNz06YBFC5nLZM7y/n61o1f5/56wJBALw+ZVzE6ly5L34114uG04W9x0HcFgau7MiJphFjgUdAtd/H9xfgE4odMRPUD3q9Me9LlMYK6MiKpfm4c2+3dzcCQQC8y37NPgpNEkd9smMwPpSEjPW41aMlfcKvP4Da3z7G5bGlmuICrva9YDAiaAyDGGCK8LxC8K6HpKrFgYrXkRtt";
    NSString *str = [RSAEncryption decryptString:_encodeTextView.text privateKey:privateKey];
    
    _decodeTextView.text = str;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
