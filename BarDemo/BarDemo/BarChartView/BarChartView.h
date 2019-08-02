//
//  BarChartView.h
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BarChartView : UIView

@property (nonatomic, strong) UICollectionView *barCollection;

/** 该属性需要最后设置，否则，以下属性不会生效 */
@property (nonatomic, strong) NSArray *barDataArray;
/** 柱子间距 默认 20 */
@property (nonatomic, assign) CGFloat barSpace;
/** 每一根柱子的圆角【若一列有多个柱子叠放，则只有第一个底部和最后一个顶部有圆角】 */
@property (nonatomic, assign) CGFloat barRadius;
/** 柱子的底部标题(若有的话)字体大小【默认13】 */
@property (nonatomic, assign) NSInteger bottomTitleFontSize;
/** 是否需要动画 */
@property (nonatomic, assign) BOOL animations;

@end

NS_ASSUME_NONNULL_END
