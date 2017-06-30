//
//  SFJContactInfoHeaderView.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/29.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJContactInfoHeaderView.h"
#import "SFJContactModel.h"
#import "SFJColorImageTool.h"

@interface SFJContactInfoHeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *phoneNUmlabel;

@end

@implementation SFJContactInfoHeaderView

+ (instancetype)headerView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (IBAction)messageAct:(UIButton *)sender {

    NSString *messageUrl = [NSString stringWithFormat:@"sms://%@",_model.phoneNums.count > 0 ? _model.phoneNums[0]: @""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:messageUrl]];
}

- (IBAction)callAct:(UIButton *)sender {
    NSString *phoneNumUrl = [NSString stringWithFormat:@"tel://%@",_model.phoneNums.count > 0 ? _model.phoneNums[0]: @""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumUrl]];
}

- (void)setModel:(SFJContactModel *)model{
    _model = model;
    NSString *phonenum = model.phoneNums.count > 0 ? model.phoneNums[0]: @"";
    _phoneNUmlabel.text = phonenum;
    
    [_userIcon setTitle:model.titleName forState:UIControlStateNormal];
    NSInteger num = phonenum.length > 0 ? [[phonenum substringFromIndex:phonenum.length - 1] integerValue] : 0;
    UIImage *image = [[SFJColorImageTool shareTool] imageWithNumber:num];
    [_userIcon setBackgroundImage:image forState:UIControlStateNormal];
}

@end
