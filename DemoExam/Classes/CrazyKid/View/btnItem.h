//
//  CCHero.h
//  UIWidgetXib
//
//  Created by Mr.C on 16/4/22.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface btnItem : NSObject

// 图像模型
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *name;

// 初始化图像模型
//- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)itemWithDict:(NSDictionary *)dict;
@end
