//
//  ZWRightCellItem.m
//  DemoExam
//
//  Created by Mr.C on 16/5/26.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "ZWRightCellItem.h"

@implementation ZWRightCellItem

+ (instancetype)rightCellItemWithDict:(NSDictionary *)dict {
    ZWRightCellItem *rItem = [[self alloc] init];
//    rItem.image = dict[@"image"];
//    rItem.title = dict[@"title"];
//    rItem.detailText = dict[@"detailText"];
    [rItem setValuesForKeysWithDictionary:dict];
    return rItem;
}

@end
