//
//  SFJColorImageTool.h
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//  缓存 生成的图片

#import <UIKit/UIKit.h>

@interface SFJColorImageTool : NSObject

+ (instancetype)shareTool;
/**
 通过电话号码的最后一位 取不同颜色的图片

 @param num 电话号码最后一位
 @return 返回不同颜色的图片
 */
- (UIImage *)imageWithNumber:(NSInteger)num;

@end
