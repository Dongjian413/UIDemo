//
//  BarCollectionCell.h
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BarCollectionCell : UICollectionViewCell
@property (nonatomic, strong) BarModel *barData;
@end

NS_ASSUME_NONNULL_END
