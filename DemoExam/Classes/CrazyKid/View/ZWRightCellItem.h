//
//  ZWRightCellItem.h
//  DemoExam
//
//  Created by Mr.C on 16/5/26.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWRightCellItem : NSObject

@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detailText;

+ (instancetype)rightCellItemWithDict:(NSDictionary *)dict;

@end
