//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  计算文字尺寸
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ComputeSize)

/// 计算一段文字的尺寸
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

/// 计算文字的尺寸
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/// 计算一段文字的高度
+ (CGFloat)heightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

/// 计算文字的高度
- (CGFloat)heightWithFont:(UIFont *)font width:(CGFloat)width;

@end
