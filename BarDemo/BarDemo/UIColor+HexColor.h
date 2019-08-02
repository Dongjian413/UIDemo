//
//  UIColor+HexColor.h
//  QWBaseproject
//
//  Created by anthann on 16/4/23.
//  Copyright © 2016年 QW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (instancetype)colorWithHexString:(NSString *)hex withAlpha:(CGFloat)alpha;
+ (instancetype)colorWithHexString:(NSString *)hex;
+ (instancetype)colorWithHex:(int)hex withAlpha:(CGFloat)alpha;
+ (instancetype)colorWithHex:(int)hex;

@end
