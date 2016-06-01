//
//  IUBtnTitleViewView.h
//  Prometheus
//
//  Created by Mr.C on 16/5/21.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZWTopBtnTitleView;
@protocol ZWTopBtnTitleViewDelegate <NSObject>

- (void)topBtnTitleView:(ZWTopBtnTitleView *)titleView ClickTitleViewBtnIndex:(NSInteger)btnIndex;

@end
@interface ZWTopBtnTitleView : UIView

/** 定义要传入的TitleView标题 */
@property (strong, nonatomic) NSArray *titleArray;

/**
 *  初始化传入的TitleView标题
 */
- (instancetype)initWithTitleArray:(NSArray *)titleArray;

/**
 *  小黑线的滑动
 */
- (void)bottomLineScollIndex:(NSInteger)index;

/** 代理属性 */
@property (weak, nonatomic) id<ZWTopBtnTitleViewDelegate> delegate;


@end
