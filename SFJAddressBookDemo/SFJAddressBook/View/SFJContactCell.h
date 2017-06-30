//
//  SFJContactCell.h
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const SFJContactCellID = @"SFJContactCellID";


@class SFJContactModel;

@interface SFJContactCell : UITableViewCell

@property (nonatomic, strong) SFJContactModel *model;

@end
