//
//  UIImage+image.m
//  小码哥彩票
//
//  Created by xiaomage on 16/5/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (UIImage *)imageWithOriImage:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    //返回一张不经过渲染图片
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
