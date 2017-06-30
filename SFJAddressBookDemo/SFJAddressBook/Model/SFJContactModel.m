//
//  SFJContactModel.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJContactModel.h"

@implementation SFJContactModel

- (NSString *)name{
    return [NSString stringWithFormat:@"%@%@",_firstName ? _firstName : @"",_lastName ? _lastName : @""];
}

- (NSString *)titleName{
    NSString *name = self.name;

    if (name.length < 1) {
        return @"";
    }
    if (name.length < 2) {
        return [name substringFromIndex:name.length - 1];
    }
    return [name substringFromIndex:name.length - 2];
}

@end
