//
//  SFJPhoneNumCell.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/29.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJPhoneNumCell.h"

@interface SFJPhoneNumCell ()
@property (weak, nonatomic) IBOutlet UILabel *phoneNumL;

@end

@implementation SFJPhoneNumCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPhonenNum:(NSString *)phonenNum{
    _phonenNum = phonenNum;
    _phoneNumL.text = phonenNum;
}

- (IBAction)messageAct:(id)sender {
    
    NSString *messageUrl = [NSString stringWithFormat:@"sms://%@",_phonenNum];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:messageUrl]];
}

- (IBAction)callAct:(id)sender {
    NSString *phoneNumUrl = [NSString stringWithFormat:@"tel://%@",_phonenNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumUrl]];
}

@end
