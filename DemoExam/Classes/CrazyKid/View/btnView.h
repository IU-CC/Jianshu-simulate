//
//  CCHeroView.h
//  UIWidgetXib
//
//  Created by Mr.C on 16/4/22.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import <UIKit/UIKit.h>
@class btnItem;

@interface btnView : UIView

@property (strong, nonatomic)btnItem *bItem;

//- (instancetype)init;
//+ (instancetype)btnView;
+ (instancetype)btnViewWithItem:(btnItem *)bItem;
@end
