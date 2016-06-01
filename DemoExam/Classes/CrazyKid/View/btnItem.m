//
//  CCHero.m
//  UIWidgetXib
//
//  Created by Mr.C on 16/4/22.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "btnItem.h"

@implementation btnItem

//- (instancetype)initWithDict:(NSDictionary *)dict
//{
//    if (self == [super init]) {
//        self.icon = dict[@"icon"];
//        self.name = dict[@"name"];
//    }
//    return self;
//}

+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    btnItem *item = [[self alloc] init];
    item.icon = dict[@"icon"];
    item.name = dict[@"name"];
    return item;
}
@end
