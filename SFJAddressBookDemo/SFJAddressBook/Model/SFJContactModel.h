//
//  SFJContactModel.h
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFJContactModel : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

@property (nonatomic, strong) NSArray *phoneNums;


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *titleName;

@end
