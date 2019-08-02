//
//  BarView.h
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BarModel;

NS_ASSUME_NONNULL_BEGIN

@interface BarView : UIView
// 子柱使用
@property (nonatomic, strong) UICollectionView *barCollection;
@property (nonatomic, assign) CGFloat superBarHeight; // 所有子柱的总高度
@property (nonatomic, strong) BarModel *barDataModel;
@end

NS_ASSUME_NONNULL_END
