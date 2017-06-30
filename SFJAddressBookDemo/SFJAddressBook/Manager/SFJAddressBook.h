//
//  SFJAddressBook.h
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFJAddressBook : NSObject

+ (instancetype)shareAddressBook;

/**
     请求访问权限
 */
- (void)requestAuthorizationAddressBook;
// 根据A B C D 、、、分组 并且去重
- (NSArray *)sections;
// 如果 该字母下的 没有数据，是会省略掉的 字母索引 标题  的数据
- (NSArray *)sectionIndexTitles;


@end
