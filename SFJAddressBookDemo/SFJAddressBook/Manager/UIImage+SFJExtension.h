//
//  UIImage+SFJExtension.h
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//  根据颜色生成图片

#import <UIKit/UIKit.h>

@interface UIImage (SFJExtension)
//+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)circleImageWithSize:(CGFloat )size color:(UIColor *)color;

+ (UIImage *)rectImageWithSize:(CGSize)size color:(UIColor *)color;

@end
