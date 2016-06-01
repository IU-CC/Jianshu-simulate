//
//  CCHeroView.m
//  UIWidgetXib
//
//  Created by Mr.C on 16/4/22.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "btnView.h"
#import "btnItem.h"

@interface btnView()

@property (weak, nonatomic) IBOutlet UIImageView *btnImageV;
@property (weak, nonatomic) IBOutlet UILabel *btnLabel;

@end
@implementation btnView



#pragma mark - 类方法封装xib的加载过程
//+ (instancetype)btnView
//{
//    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
//}
+ (instancetype)btnViewWithItem:(btnItem *)bItem
{
    btnView *btnV = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject]; // 调用上面创建的控件
    btnV.bItem = bItem;                  // 将模型传给控件
    return btnV;                        // 返回控件
}

#pragma mark - 设置数据
- (void)setBItem:(btnItem *)bbItem {
    _bItem = bbItem;
    NSLog(@"%@", bbItem.icon);
    self.btnImageV.image = [UIImage imageNamed:bbItem.icon];
    NSLog(@"%@", bbItem.name);
    self.btnLabel.text = bbItem.name;
}
@end
