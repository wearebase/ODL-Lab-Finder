//
//  UIColor+DANAdditions.h
//
//  Copyright (c) 2014 Daniel Tomlinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DANAdditions)

+ (UIColor *)colorFromHexString:(NSString *)hexString;

- (UIColor *)lighten:(CGFloat)amount;
- (UIColor *)darken:(CGFloat)amount;

- (UIColor *)saturate:(CGFloat)amount;
- (UIColor *)desaturate:(CGFloat)amount;

- (UIColor *)invert;
- (UIColor *)greyscale;

- (UIColor*)colorWithMockAlphaOnWhite:(CGFloat)mockAlpha;
- (UIColor*)colorBlendedOnColor:(UIColor*)blendColor;

@end
