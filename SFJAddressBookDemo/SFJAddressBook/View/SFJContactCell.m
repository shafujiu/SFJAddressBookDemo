//
//  SFJContactCell.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJContactCell.h"
#import "SFJContactModel.h"
#import "SFJColorImageTool.h"

@interface SFJContactCell ()

@property (weak, nonatomic) IBOutlet UIButton *userIcon;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation SFJContactCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(SFJContactModel *)model{
    _model = model;
    _nameLabel.text = model.name;

    NSString *phonenum = model.phoneNums.count > 0 ? model.phoneNums[0]: @"";
    _phoneLabel.text = phonenum;
    
    [_userIcon setTitle:model.titleName forState:UIControlStateNormal];
    
    NSInteger num = phonenum.length > 0 ? [[phonenum substringFromIndex:phonenum.length - 1] integerValue] : 0;
    UIImage *image = [[SFJColorImageTool shareTool] imageWithNumber:num];
    
    [_userIcon setBackgroundImage:image forState:UIControlStateNormal];
}

- (IBAction)call:(UIButton *)sender {
    NSString *phoneNumUrl = [NSString stringWithFormat:@"tel://%@",_model.phoneNums.count > 0 ? _model.phoneNums[0]: @""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumUrl]];
}


@end
