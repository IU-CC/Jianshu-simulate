//
//  IUBtnTitleViewView.m
//  Prometheus
//
//  Created by Mr.C on 16/5/21.
//  Copyright © 2016年 Mr.C. All rights reserved.
//
// 设置小黑线长度为btn的一半
#pragma mark - 自定义TitleView的Button
//自定义的按钮

@interface TitleBtn : UIButton
//中间的线
@property (nonatomic, weak) UIView *middleV;
//是否隐藏线
@property (nonatomic, assign) BOOL isHiddenMiddle;
@end

@implementation TitleBtn

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *middleV = [[UIView alloc] init];
        middleV.backgroundColor = ZWColor(50, 50, 50, 0.3);
        [self addSubview:middleV];
        self.middleV = middleV;
    }
    return self;
}
- (void)setIsHiddenMiddle:(BOOL)isHiddenMiddle {
    _isHiddenMiddle = isHiddenMiddle;
    if (isHiddenMiddle) {
        self.middleV.hidden = YES;
    }else {
        self.middleV.hidden = NO;
    }
}
//布局子控件
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    CGFloat middleH = self.height * 0.5;
//    CGFloat y = (self.height - middleH) * 0.5;
//    self.middleV.frame = CGRectMake(self.width, y, 1, middleH);
//}
@end

#pragma mark - 自定义TitleView的所有功能实现

#import "ZWTopBtnTitleView.h"

@interface ZWTopBtnTitleView ()

//底层线
@property (nonatomic, weak) UIView *bottomLine;
//当前选中的按钮
@property (nonatomic, weak) UIButton *selectBtn;
//按钮的宽度
@property (nonatomic, assign)CGFloat btnW;

@end
@implementation ZWTopBtnTitleView

- (instancetype)initWithTitleArray:(NSArray *)array {
    if (self = [super init]) {
        self.titleArray = array;
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    // 遍历传进来的标题名(有几个标题就有几个按钮)
    for (NSString *title in titleArray) {
        
        TitleBtn *lightBtn = [TitleBtn buttonWithType:UIButtonTypeCustom];
        [lightBtn setTitle:title forState:UIControlStateNormal];
        [lightBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        // 未选中时的颜色
        [lightBtn setTitleColor:ZWColor(196, 196, 196, 1.0) forState:UIControlStateNormal];
        // 选中时的颜色
        [lightBtn setTitleColor:ZWColor(233, 129, 109, 1.0) forState:UIControlStateSelected];
        [self addSubview:lightBtn];
        [lightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (self.subviews.count == titleArray.count) {
            lightBtn.isHiddenMiddle = YES;
            
        }
        
    }
    [self setBottomLine];
}

//添加底部的线
- (void)setBottomLine {
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = ZWColor(233, 129, 109, 1);
    [self addSubview:bottomLine];
    self.bottomLine = bottomLine;
}

//按钮点击
- (void)btnClick:(UIButton *)btn {
    //取消上次选中的按钮
    self.selectBtn.selected = NO;
    btn.selected = YES;
    //将当前点击的按钮变成选中的按钮
    self.selectBtn = btn;
    
    [UIView animateWithDuration:0.25 animations:^{
        // 让小黑线的位置(x)跟随点击的btn
//        self.bottomLine.x = btn.x;
        // 算了好久
        self.bottomLine.x = btn.x + ((self.btnW - self.bottomLine.width) * 0.5);
    }];
    
//    [UIView animateWithDuration:0.25 animations:^{
//        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
//            // 动画的时间曲线
//            self.bottomLine.x = btn.x;
//            
//        } completion:nil];
//    }];
    //调用代理
    if ([self.delegate respondsToSelector:@selector(topBtnTitleView:ClickTitleViewBtnIndex:)]) {
        // 将当前btn的tag值传出去(tag最大值是传进来的按钮模型数组个数, 默认为0)
        [self.delegate topBtnTitleView:self ClickTitleViewBtnIndex:btn.tag];
    }
}

//底部线滚动到对应的位置
//弹簧效果
//- (void)bottomLineScollIndex:(NSInteger)index {
//    [UIView animateWithDuration:0.25 animations:^{
//        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
//            //设置线的位置
////            NSLog(@"-----%ld", index);
////            self.bottomLine.x = index * self.btnW;
//            // 算了好久
//            self.bottomLine.x = index * self.btnW + ((self.btnW - self.bottomLine.width) * 0.5);
//            UIButton *btn = self.subviews[index];
//            //设置按钮选中
//            self.selectBtn.selected = NO;
//            btn.selected = YES;
//            self.selectBtn = btn;
//        } completion:nil];
//    }];
//}
- (void)bottomLineScollIndex:(NSInteger)index {
    [UIView animateWithDuration:0.20 animations:^{
//            NSLog(@"-----%ld", index);
//            self.bottomLine.x = index * self.btnW;
            // 算了好久
            self.bottomLine.x = index * self.btnW + ((self.btnW - self.bottomLine.width) * 0.5);
            UIButton *btn = self.subviews[index];
            //设置按钮选中
            self.selectBtn.selected = NO;
            btn.selected = YES;
            self.selectBtn = btn;
    }];
}
//布局子控件(跟彩票自定义tabBar底部按钮相似)
- (void)layoutSubviews {
    [super layoutSubviews];
    int count = (int)self.subviews.count - 1;
    self.btnW = self.width /  count;
    CGFloat btnH = self.height;
    for (int i = 0; i < count; i++) {
        //取出按钮
        TitleBtn *btn = self.subviews[i];
        btn.frame = CGRectMake(i * self.btnW, 0, self.btnW, btnH);
        btn.tag = i;
        if (i == 0) {
            [self btnClick:btn];
        }
    }
//    self.bottomLine.frame = CGRectMake(0, self.height - 2, self.btnW * 0.5, 2);
    // 算了好久
//    self.bottomLine.center = CGPointMake(self.btnW * 0.5, self.height - 2);
    self.bottomLine.centerY = self.height - 2;
    self.bottomLine.size = CGSizeMake(self.btnW * 0.5, 2.0);
}


@end
