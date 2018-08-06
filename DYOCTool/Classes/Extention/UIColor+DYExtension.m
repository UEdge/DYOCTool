//
//  UIColor+DYExtension.m
//  MCRM
//
//  Created by Jason on 16/8/6.
//
//

#import "UIColor+DYExtension.h"

@implementation UIColor (DYExtension)
/**
 透明度固定为1，以0x开头的十六进制转换的颜色[eg:#666666]
 
 @param hexColor hexColor
 @return UIColor
 */
+ (UIColor*) colorWithHex:(long)hexColor{
    return [UIColor colorWithHex:hexColor alpha:1.0];
}

/**
 0x开头的十六进制转换成的颜色,透明度可调整
 
 @param hexColor hexColor
 @param opacity alpha
 @return UIColor
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}


/**
 iOS中十六进制的颜色（以#开头）转换为UIColor
 
 @param color color
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

/**
 iOS中十六进制的颜色（以#开头）转换为UIColor 透明度可调整
 
 @param color color
 @param alpha alpha
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(float)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

/**
 grayColor

 @return UIColor
 */
+ (UIColor *)crm_grayColor {
    return [UIColor colorWithHexString:@"#666666"];
}

/**
 blackColor

 @return UIColor
 */
+ (UIColor *)crm_blackColor {
    return [UIColor colorWithHexString:@"#1d1d26"];
}

/**
 redColor

 @return UIColor
 */
+ (UIColor *)crm_redColor {
    return [UIColor colorWithHexString:@"#e14238"];
}

/**
 UIColor

 @return orangeColor
 */
+ (UIColor *)crm_orangeColor {
    return [UIColor colorWithHexString:@"#ee7524"];
}


/**
  随机色

 @param alpha alpha
 @return randomColor
 */
+(UIColor *)randomColoralpha:(float)alpha {
    
   return  [UIColor
     colorWithRed:((float)arc4random_uniform(256)/255.0)
     green:((float)arc4random_uniform(256)/255.0)
     blue:((float)arc4random_uniform(256)/255.0) alpha:alpha];
}

@end
