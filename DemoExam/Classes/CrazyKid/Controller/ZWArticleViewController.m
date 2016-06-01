//
//  ZWArticleViewController.m
//  TestDemo
//
//  Created by Mr.C on 16/5/25.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "ZWArticleViewController.h"
#import "ZWTopBtnTitleView.h"
#import "ZWRightContentView.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

@interface ZWArticleViewController ()<UIScrollViewDelegate, ZWTopBtnTitleViewDelegate, UITableViewDelegate, UITableViewDataSource>

//@property (weak, nonatomic) UIView *nav;
@property (strong, nonatomic) UIImageView *topImageV;
@property (weak, nonatomic) UIScrollView *bottomScrollV;
@property (weak, nonatomic) UITableView *leftTableV;
@property (weak, nonatomic) UITableView *middleTableV;
@property (weak, nonatomic) ZWRightContentView *rightCV;

@property (assign, nonatomic) NSInteger indexTableV;

@property (weak, nonatomic) ZWTopBtnTitleView *optionV;


@end

@implementation ZWArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    [self setScrollView];
    [self setTableView];
    [self setOptionV];
}

- (void)setNav {
    /*
    //创建导航条
    UIView *nav = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, 64)];
    nav.backgroundColor = ZWColor(254, 254, 254, 254);
    nav.alpha = 1;
    self.nav = nav;
    //1.加载图片
    UIImage *image = [UIImage imageNamed:@"Klaus"];
    // --------------------------------------好麻烦的方法------------------------
//    //2.开启一个位图上下文(跟原始图片尺寸一样大)
//    UIGraphicsBeginImageContext(image.size);
//    //3.绘制一个圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//    [path addClip];
//    //4.把图片绘制到上下文当中
//    [image drawAtPoint:CGPointZero];
//    //5.从上下文当中生成一张新的图片
//    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
//    //6.关闭位图上下文
//    UIGraphicsEndImageContext();
//    // 创建一个ImageView
//    UIImageView *imageV = [[UIImageView alloc] initWithImage:newImage];
//    imageV.center = CGPointMake(screenW * 0.5, nav.frame.size.height * 0.65);
//    imageV.bounds = CGRectMake(0, 0, 38, 38);
////    [imageV setImage:newImage];
    // ---------------------------------麻烦的方法到此为止, 以下简单暴力!!!-----------------
    UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
    imageV.layer.masksToBounds = YES;
    imageV.layer.cornerRadius = 20;
    imageV.center = CGPointMake(screenW * 0.5, nav.frame.size.height * 0.65);
    imageV.bounds = CGRectMake(0, 0, 40, 40);
    
    [nav addSubview:imageV];
    [self.view addSubview:nav];
    */
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    titleView.backgroundColor = [UIColor clearColor];
    _topImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    _topImageV.backgroundColor = [UIColor whiteColor];
    _topImageV.layer.cornerRadius = self.topImageV.bounds.size.width * 0.5;
    _topImageV.layer.masksToBounds = YES;
    _topImageV.image = [UIImage imageNamed:@"Klaus"];
    [titleView addSubview:_topImageV];
    self.navigationItem.titleView = titleView;
    
}
// 设置选项条
- (void)setOptionV {
    ZWTopBtnTitleView *optionV = [[ZWTopBtnTitleView alloc] initWithTitleArray:@[@"动态",@"文章", @"更多"]];
    self.indexTableV = (NSInteger)optionV.titleArray.count;
//    self.indexTableV = optionV.titleArray.count;
//    optionV.backgroundColor = ZWColor(230, 230, 230, 1.0);
    optionV.backgroundColor = ZWColor(254, 254, 254, 1);
    optionV.frame =  CGRectMake(0, navH + 1, screenW, 38);
    optionV.delegate = self;
    [self.view addSubview:optionV];
    self.optionV = optionV;
    // 设置"边框"
    
}
// 选项条的代理
- (void)topBtnTitleView:(ZWTopBtnTitleView *)titleView ClickTitleViewBtnIndex:(NSInteger)btnIndex {
    [self.bottomScrollV setContentOffset:CGPointMake(screenW * btnIndex, 0) animated:YES];
}
- (void)setScrollView {
    //创建ScorllView同时设置大小
    UIScrollView *bottomScrollV = [[UIScrollView alloc] initWithFrame: CGRectMake(0, navH + 38 + 2, screenW, screenH - navH - 38 - 2)];
    //设置scrollView属性.
//    bottomScrollV.backgroundColor = [UIColor orangeColor];

    //设置contentSize
    bottomScrollV.contentSize = CGSizeMake(screenW * 3, 0);
    //设置能够分页
    bottomScrollV.pagingEnabled = YES;
    //设置代理
    bottomScrollV.delegate = self;
    // 关闭弹簧效果
    bottomScrollV.bounces = NO;
    // 隐藏scrollview垂直/水平拉条
//    bottomScrollV.showsVerticalScrollIndicator = NO;
//    bottomScrollV.showsHorizontalScrollIndicator = NO;
    //创建属性记录创建的ScrollView
    self.bottomScrollV = bottomScrollV;
    //把创建的scorllView添加到当前View
    [self.view addSubview:bottomScrollV];
}
- (void)setTableView {
    // 左边
    //screenW * (self.indexTableV - 1)
    UITableView *leftTableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenW, self.bottomScrollV.height) style:UITableViewStylePlain];
//    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(screenW, 0, screenW, screenH - navH - tabBarH) style:UITableViewStylePlain];
    leftTableV.backgroundColor = [UIColor purpleColor];
    //设置没有分隔线
//    leftTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 隐藏tableV垂直拉条
    //    rightTableV.showsVerticalScrollIndicator = NO;
    //    //设置行高并添加到scrollview
    //    rightTableV.rowHeight = 200;
    //设置数据源
    self.leftTableV = leftTableV;
    leftTableV.dataSource = self;
    leftTableV.delegate = self;
    [self.bottomScrollV addSubview:self.leftTableV];
    
    // 中间
    UITableView *middleTableV = [[UITableView alloc]initWithFrame:CGRectMake(screenW, 0, screenW, self.bottomScrollV.height) style:UITableViewStylePlain];
    //    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(screenW, 0, screenW, screenH - navH - tabBarH) style:UITableViewStylePlain];
    middleTableV.backgroundColor = [UIColor purpleColor];
    //设置没有分隔线
//    middleTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 隐藏tableV垂直拉条
    //    rightTableV.showsVerticalScrollIndicator = NO;
    //    //设置行高并添加到scrollview
    //    rightTableV.rowHeight = 200;
    //设置数据源
    self.middleTableV = middleTableV;
    middleTableV.dataSource = self;
    middleTableV.delegate = self;
    [self.bottomScrollV addSubview:self.middleTableV];
    
    // 右边
//    UITableView *rightTableV = [[UITableView alloc]initWithFrame:CGRectMake(screenW * 2.0, 0, screenW, screenH - navH - 38) style:UITableViewStyleGrouped];
//    //    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(screenW, 0, screenW, screenH - navH - tabBarH) style:UITableViewStylePlain];
//    rightTableV.backgroundColor = [UIColor purpleColor];
//    //设置没有分隔线
//    rightTableV.contentInset = UIEdgeInsetsMake(-tableVInset, 0, 0, 0);
//    rightTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
//    // 隐藏tableV垂直拉条
//    //    rightTableV.showsVerticalScrollIndicator = NO;
//    //    //设置行高并添加到scrollview
//    //    rightTableV.rowHeight = 200;
//    //设置数据源
//    self.rightTableV = rightTableV;
//    rightTableV.dataSource = self;
//    rightTableV.delegate = self;
//    [self.bottomScrollV addSubview:self.rightTableV];
    ZWRightContentView *rightCV = [ZWRightContentView rightContentView];
    rightCV.x = screenW * 2;
    rightCV.y = 0;
    rightCV.width = screenW;
//    rightCV.height = self.bottomScrollV.height;
    self.rightCV = rightCV;
    [self.bottomScrollV addSubview:rightCV];
    
}
#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  // 减速完毕调用
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView  // 正在滚动时调用
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate // 停止滚动时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.bottomScrollV) {
        // 根据scrollView偏移的位置(页面)计算页数
        int pageIndex = (int)(self.bottomScrollV.contentOffset.x / screenW + 0.5);
        ZWTopBtnTitleView *titleView = self.optionV;
        // 从而让小黑线跟随页面滑动
        [titleView bottomLineScollIndex:pageIndex];
        
        NSLog(@"%f", self.bottomScrollV.contentOffset.y);
    }
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"person";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
//    cell.textAlignment = NSTextAlignmentCenter;
    if (tableView == _leftTableV) {
        cell.textLabel.text = @"世间只有我最帅!!!";
        // 让leftTableV的内容显示在中间
//        NSLog(@"")
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
//        cell.textLabel.frame = cellFrame;
    }else if (tableView == _middleTableV) {
        cell.textLabel.text = @"世上只有你最美!!!";
        // 让middleTableV的内容显示在中间
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
