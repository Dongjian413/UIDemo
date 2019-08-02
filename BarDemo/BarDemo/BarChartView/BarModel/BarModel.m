//
//  BarModel.m
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import "BarModel.h"

@implementation BarModel

- (UIColor *)barColor
{
    if (_barColor == nil) {
        return [UIColor blackColor];
    } else {
        return _barColor;
    }
}

- (NSString *)barBottomTitle
{
    if (_barBottomTitle == nil) {
        // 这里返回一个空格是为了占据一个位置
        return @" ";
    } else {
        return _barBottomTitle;
    }
}

@end
