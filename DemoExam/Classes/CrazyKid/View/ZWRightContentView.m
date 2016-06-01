//
//  ZWRightView.m
//  DemoExam
//
//  Created by Mr.C on 16/5/25.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "ZWRightContentView.h"
#import "btnItem.h"
#import "btnView.h"
#import "ZWRightCellItem.h"
@interface ZWRightContentView ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *rightTableV;
@property (weak, nonatomic) IBOutlet UIView *optionsView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) UIButton *btn;
@property (assign, nonatomic) CGFloat btnW;
@property (strong, nonatomic) NSArray *itemArray;
@property (strong, nonatomic) NSArray *cellArray;

@end
@implementation ZWRightContentView
- (NSArray *)itemArray {
    if (!_itemArray) {

        _itemArray = @[
                   @{
                      @"icon":@"wenji", @"name":@"文集"
                       },
                   @{
                       @"icon":@"zhuanlan", @"name":@"专栏"
                       },
                   @{
                       @"icon":@"guanzhu", @"name":@"关注"
                       },
                   @{
                       @"icon":@"fensi", @"name":@"粉丝 183"
                       }
                   ];
        }
    return _itemArray;
}
- (NSArray *)cellArray {
    if (!_cellArray) {
        _cellArray = @[
                       @{
                           @"image":@"xihuan", @"title":@"喜欢的文章", @"detailText":@"5"
                           },
                       @{
                           @"image":@"gou", @"title":@"已阅读的软文", @"detailText":@"5"
                           }
                       ];
        // 切记!!! 手动写数据, 一定要字典转模型!!!###############@@@@@@@@@@@@@@@##############
        NSArray *cArray = _cellArray;
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in cArray) {
            ZWRightCellItem *item = [ZWRightCellItem rightCellItemWithDict:dict];
            [temp addObject:item];
        }
        _cellArray = temp;
    }
    return _cellArray;
}
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.optionsView.bounds = CGRectMake(0, 0, screenW, 60);
//    int count = (int)self.itemArray.count;
//    NSLog(@"kkk%d", count);
//    CGFloat x = 0;
//    CGFloat y = 0;
//    CGFloat w = self.optionsView.width / count;
//    CGFloat h = self.optionsView.height;
//    for (int i = 0; i < count; i++) {
//        // 每一个按钮的x值
//        x = i * w;
//        self.btn.frame = CGRectMake(x, y, w, h);
//        [self.optionsView addSubview:self.btn];
//    }
}
+ (instancetype)rightContentView {
    return [[[NSBundle mainBundle]loadNibNamed:@"ZWRightContentView" owner:nil options:nil]lastObject];
}
- (void)awakeFromNib {

    CGFloat btnW = self.optionsView.width / (int)self.itemArray.count;
//    NSLog(@"%f", btnW);
    self.btnW = btnW;
    for (int i = 0; i < (int)self.itemArray.count; i++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UIButton *btn = [[UIButton alloc] init];
        // 手动获取模型(用遍历的方式, 而不是用字典转模型方式)
        btnItem *bItem = [btnItem itemWithDict:self.itemArray[i]];
        //把获取的数据模型传给btnView xib控件上
        btnView *btnV = [btnView btnViewWithItem:bItem];
        
        self.btn = btn;
        btn.frame = CGRectMake(i * btnW, 0, btnW, self.optionsView.height);
        [btn sizeToFit];
//        [btn imageForState:UIControlStateNormal];
        [btn addSubview:btnV];
        [self.optionsView addSubview:btn];
    }
//    [self.btn1 addSubview:btnV.]
////    [self.btn1 setImage:[UIImage imageWithOriImage:@"wenji"] forState:UIControlStateNormal];
////    [self.btn1 setTitle:@"文集" forState:UIControlStateNormal];
////    [self.btn1 setTitleEdgeInsets:UIEdgeInsetsMake(-70, 20, 0, -20)];
////    [self.btn1 sizeToFit];
//    [self.btn2 setImage:[UIImage imageWithOriImage:@"zhuanlan"] forState:UIControlStateNormal];
//    [self.btn2 setTitle:@"专栏" forState:UIControlStateNormal];
//    [self.btn2 sizeToFit];
//    [self.btn3 setImage:[UIImage imageWithOriImage:@"guanzhu"] forState:UIControlStateNormal];
//    [self.btn3 setTitle:@"关注" forState:UIControlStateNormal];
//    [self.btn3 sizeToFit];
//    [self.btn4 setImage:[UIImage imageWithOriImage:@"fensi"] forState:UIControlStateNormal];
//    [self.btn4 setTitle:@"粉丝" forState:UIControlStateNormal];
//    [self.btn4 sizeToFit];
    [self setTableV];
    
}

- (void)setTableV {
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenW, self.height) style:UITableViewStyleGrouped];
    tableV.contentInset = UIEdgeInsetsMake(self.optionsView.height, 0, 0, 0);
    tableV.delegate = self;
    tableV.dataSource = self;
    self.rightTableV = tableV;
    [self.bottomView addSubview:tableV];
    tableV.rowHeight = 39;
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return self.cellArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
//    ZWRightCellItem *item = [ZWRightCellItem rightCellItemWithDict:self.cellArray[0]];
    ZWRightCellItem *item = self.cellArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:item.image];  // 自己手动写的懒加载, 需要转模型
    cell.textLabel.text = item.title;
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.detailTextLabel.text = item.detailText;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    return cell;
    
}
// 实现点击cell跳转
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    ZWSetGroupItem *groupItem = self.dataArray[indexPath.section];
//    ZWSetRowItem *rowItem = groupItem.rowArray[indexPath.row];
//    if ([rowItem isKindOfClass:[ZWArrowItem class]]) {
//        ZWArrowItem *arrowItem = (ZWArrowItem *)rowItem;
//        if (arrowItem.rowTask) {
//            arrowItem.rowTask(indexPath);
//            return;
//        }
//        if (arrowItem.desClass) {
//            UIViewController *vc = [[arrowItem.desClass alloc] init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//    }
//}

@end
