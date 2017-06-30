//
//  SFJColorImageTool.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJColorImageTool.h"
#import "UIImage+SFJExtension.h"
//颜色
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

static CGFloat const kCircleSize = 45;
@implementation SFJColorImageTool
{
    UIImage *img0_, *img1_, *img2_, *img3_, *img4_, *img5_, *img6_, *img7_, *img8_, *img9_;
}
static SFJColorImageTool *colortool = nil;
+ (instancetype)shareTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colortool = [[self alloc] init];
    });
    return colortool;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self p_setup];
    }
    return self;
}

- (void)p_setup{
    
    img0_ = [UIImage circleImageWithSize:kCircleSize color:kRGBColor(237, 183, 108)];
    img1_ = [UIImage circleImageWithSize:kCircleSize color:kRGBColor(97, 137, 170)];
    img2_ = [UIImage circleImageWithSize:kCircleSize color:kRGBColor(98, 112, 163)];
    img3_ = [UIImage circleImageWithSize:kCircleSize color:kRGBColor(226, 121, 101)];
    img4_ = [UIImage circleImageWithSize:kCircleSize color:kRGBColor(90, 191, 152)];
    img5_ = [UIImage circleImageWithSize:kCircleSize color:kRGBColor(100, 168, 229)];
    img6_ = [UIImage circleImageWithSize:kCircleSize color:kRGBColor(173, 138, 123)];
    
    img7_ = img1_;
    img8_ = img2_;
    img9_ = img5_;
}

- (UIImage *)imageWithNumber:(NSInteger)num{
    switch (num) {
        case 0: return img0_;
        case 1: return img1_;
        case 2: return img2_;
        case 3: return img3_;
        case 4: return img4_;
        case 5: return img5_;
        case 6: return img6_;
        case 7: return img7_;
        case 8: return img8_;
        case 9: return img9_;
        default: return img0_;
    }
}


@end
