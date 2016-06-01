//
//  UIView+Frame.h
//  小码哥彩票
//
//  Created by xiaomage on 16/5/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

//分类一般情是不能添加属性.
//但是,如果非得要添加添加属性的话, 一定要去实现该属性的set方法跟get方法(1.手动去写set,get 2.利用@dynamic x; 自动生成)

//在分类当中不会生成带有下划线的成员属性

@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat centerX;
@property(nonatomic, assign) CGFloat centerY;
@property(nonatomic, assign) CGPoint origin;
@property(nonatomic, assign) CGSize size;

@end
