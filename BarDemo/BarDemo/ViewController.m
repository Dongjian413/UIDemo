//
//  ViewController.m
//  BarDemo
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 happy. All rights reserved.
//

#import "ViewController.h"
#import "BarChartView.h"
#import "UIColor+HexColor.h"

// 16进制颜色
#define COLOR_HEX(string) [UIColor colorWithHexString:string]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *bars = [NSMutableArray array];
    BarModel *model1 = [[BarModel alloc] init];
    model1.barValue = 368;
    model1.barColor = COLOR_HEX(@"#31A8E7");
    model1.barBottomTitle = @"柱子1";
    model1.animations = YES; // 针对单个柱状图设置动画
    [bars addObject:model1];
    
    BarModel *model2 = [[BarModel alloc] init];
    model2.barValue = 315;
    model2.barColor = COLOR_HEX(@"#63D6D7");
    model2.barBottomTitle = @"柱子2";
    [bars addObject:model2];
    
    BarModel *model3 = [[BarModel alloc] init];
    model3.barValue = 217;
    model3.barColor = COLOR_HEX(@"#EE8453");
    model3.barBottomTitle = @"柱子3";
    [bars addObject:model3];
    
    BarModel *model4 = [[BarModel alloc] init];
    model4.barValue = 148;
    model4.barColor = COLOR_HEX(@"#F7C850");
    model4.barBottomTitle = @"柱子4";
    [bars addObject:model4];
    
    BarModel *subModel1 = [[BarModel alloc] init];
    subModel1.barValue = 65;
    subModel1.barColor = COLOR_HEX(@"#86CB23");
    subModel1.barBottomTitle = @"成功";
    
    BarModel *subModel2 = [[BarModel alloc] init];
    subModel2.barValue = 25;
    subModel2.barColor = COLOR_HEX(@"#F75B57");
    subModel2.barBottomTitle = @"失败";
    
    BarModel *model5 = [[BarModel alloc] init];
    model5.barValue = 90;
    model5.subBarModel = @[
                           subModel2,
                           subModel1,
                           ];
    model5.barColor = [UIColor clearColor];
    model5.barBottomTitle = @"柱子5";
    [bars addObject:model5];
    
    BarChartView *barView = [[BarChartView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
        barView.animations = YES; // 针对所有柱状图设置动画
    barView.barRadius = 0;
    barView.barSpace = 0;
    barView.barDataArray = bars;
    //    barView.backgroundColor = [UIColor redColor];
    [self.view addSubview:barView];
}


@end
