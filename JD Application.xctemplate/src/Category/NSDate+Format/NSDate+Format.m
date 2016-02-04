//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

/**
 *  将字符串转为日期
 *
 *  @param strDate 字符串日期
 *
 *  @return 日期
 */
+ (NSDate*)convertDateFromString:(NSString*)strDate
{
    if ([strDate length] == 0) return nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:strDate];
    return date;
}

/**
 *  格式化默认时间戳
 *
 *  @return 格式化字符串
 */
- (NSString *)defaultDateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *day = @"";
    if ([self isToday]) {
        [formatter setDateFormat:@"HH:mm"];
    } else if ([self isYesterday]) {
        day = NSLocalizedStringFromTable(@"Yesterday", @"DateFormat", nil);
        [formatter setDateFormat:@" HH:mm"];
    } else {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    return [day stringByAppendingString:[formatter stringFromDate:self]];
}

/**
 *  判断是否为今天
 *
 *  @return 判断结果
 */
- (BOOL)isToday
{
    NSDate *today = [NSDate date];
    return [[[today description] substringToIndex:10] isEqualToString:[[self description] substringToIndex:10]];
}

/**
 *  判断是否为昨天
 *
 *  @return 判断结果
 */
- (BOOL)isYesterday
{
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:-(24 * 60 * 60)];
    return [[[yesterday description] substringToIndex:10] isEqualToString:[[self description] substringToIndex:10]];
}

@end
