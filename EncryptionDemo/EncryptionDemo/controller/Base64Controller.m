//
//  Base64Controller.m
//  EncryptionDemo
//
//  Created by tianmaotao on 2017/6/13.
//  Copyright © 2017年 tianmaotao. All rights reserved.
//

#import "Base64Controller.h"
#import "Base64Encryption.h"

@interface Base64Controller ()

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@property (weak, nonatomic) IBOutlet UITextView *outTextView;

@end

@implementation Base64Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)action:(id)sender {
    if ([_inputTextField.text isEqualToString:@""]) {
        return ;
    }
    
    _outTextView.text = [Base64Encryption base64EncodeString:_inputTextField.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
