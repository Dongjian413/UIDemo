//
//  BarModel.h
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define BAR_WIDTH 50

NS_ASSUME_NONNULL_BEGIN

@interface BarModel : NSObject

@property (nonatomic, strong) NSArray <BarModel *>*subBarModel;

@property (nonatomic, assign) CGFloat barValue;
@property (nonatomic, strong) UIColor *barColor;
@property (nonatomic, assign) CGFloat barRadius;
@property (nonatomic, copy) NSString *barBottomTitle; // 有多个叠加在一列上时，只显示第一个
@property (nonatomic, assign) CGFloat barScale;
@property (nonatomic, assign) BOOL animations;

@property (nonatomic, assign) NSInteger bottomTitleFontSize;
@property (nonatomic, assign) CGFloat barBottomTitleWidth;
@property (nonatomic, assign) CGFloat barBottomTitleHeight;



@end

NS_ASSUME_NONNULL_END
