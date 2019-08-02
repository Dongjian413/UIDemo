//
//  UIColor+HexColor.m
//  QWBaseproject
//
//  Created by anthann on 16/4/23.
//  Copyright © 2016年 QW. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

+ (instancetype)colorWithHexString:(NSString *)hex withAlpha:(CGFloat)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

+ (instancetype)colorWithHexString:(NSString *)hex {
    return [UIColor colorWithHexString:hex withAlpha:1.0];
}

+ (instancetype)colorWithHex:(int)hex withAlpha:(CGFloat)alpha {
    
    CGFloat r = ((hex & 0xFF0000) >> 16) / 255.0;
    CGFloat g = ((hex & 0x00FF00) >> 8 ) / 255.0;
    CGFloat b = ((hex & 0x0000FF)      ) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

+ (instancetype)colorWithHex:(int)hex {
    return [UIColor colorWithHex:hex withAlpha:1.0];
}

@end
