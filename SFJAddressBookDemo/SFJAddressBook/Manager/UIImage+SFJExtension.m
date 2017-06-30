//
//  UIImage+SFJExtension.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "UIImage+SFJExtension.h"

@implementation UIImage (SFJExtension)

/** 根据颜色生成纯色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self circleImageWithSize:40 color:color];
}

+ (UIImage *)circleImageWithSize:(CGFloat )size color:(UIColor *)color{

    CGRect rect = CGRectMake(0.0f, 0.0f, size, size);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillEllipseInRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/** 根据颜色生成纯色图片 */
+ (UIImage *)rectImageWithSize:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
