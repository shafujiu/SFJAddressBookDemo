//
//  SFJContactInfoHeaderView.h
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/29.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SFJContactModel;

static CGFloat const SFJContactInfoHeaderViewHeight = 200;

@interface SFJContactInfoHeaderView : UIView

@property (nonatomic, strong) SFJContactModel *model;

+ (instancetype)headerView;

@end
