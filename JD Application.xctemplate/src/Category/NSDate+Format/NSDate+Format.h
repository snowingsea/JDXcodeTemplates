//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  格式化时间戳
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)

/// 将字符串转为日期
+ (NSDate*)convertDateFromString:(NSString*)strDate;

/// 格式化默认时间戳
- (NSString *)defaultDateFormat;

/// 判断是否为今天
- (BOOL)isToday;

/// 判断是否为昨天
- (BOOL)isYesterday;

@end
