//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "NSString+ComputeSize.h"

@implementation NSString (ComputeSize)

/**
 *  计算一段文字尺寸
 *
 *  @param text    文字
 *  @param font    字体
 *  @param maxSize 最大尺寸
 *
 *  @return 尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [text sizeWithFont:font maxSize:maxSize];
}

/**
 *  计算文字尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 *
 *  @return 尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

/**
 *  计算一段文字尺寸
 *
 *  @param text  文字
 *  @param font  字体
 *  @param width 给定宽度
 *
 *  @return 高度
 */
+ (CGFloat)heightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    return [text heightWithFont:font width:width];
}

/**
 *  计算文字高度
 *
 *  @param font  字体
 *  @param width 给定宽度
 *
 *  @return 高度
 */
- (CGFloat)heightWithFont:(UIFont *)font width:(CGFloat)width
{
    return [self sizeWithFont:font maxSize:CGSizeMake(width, MAXFLOAT)].height;
}

@end
