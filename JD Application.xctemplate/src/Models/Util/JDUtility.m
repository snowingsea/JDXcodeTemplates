//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDUtility.h"
#import <sys/sysctl.h>
#import <CommonCrypto/CommonDigest.h>

@implementation JDUtility

#pragma mark - 系统相关

/**
 *  获取当前设备型号
 *
 *  @return 设备型号
 */
+ (NSString *)platformString {
    // Gets a string with the device model
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);

    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";

    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";

    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";

    if ([platform isEqualToString:@"i386"])         return @"Simulator i386";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator x86_64";

    return platform;
}

#pragma mark - 加密相关

/**
 *  sha1加密
 *
 *  @param input 明文
 *
 *  @return 密文
 */
+ (NSString*)sha1:(NSString *)input {
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

/**
 *  sha256加密
 *
 *  @param input 明文
 *
 *  @return 密文
 */
+ (NSString*) sha256:(NSString *)input
{
    const char *s = [input cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
    CC_SHA256(keyData.bytes, (unsigned int)keyData.length, digest);
    NSData *out = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash = [out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

#pragma mark - 判定相关

/**
 *  判断字符串是否是正整数
 *
 *  @param string 字符串
 *
 *  @return 判定结果
 */
+ (BOOL)isPureInt:(NSString *)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - 线程相关

/**
 *  主线程队列
 *
 *  @param queue 队列回调
 */
+ (void)runInMainQueue:(void (^)())queue{
    dispatch_async(dispatch_get_main_queue(), queue);
}

/**
 *  线程队列
 *
 *  @param queue 队列回调
 */
+ (void)runInGlobalQueue:(void (^)())queue{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), queue);
}

/**
 *  延时运行
 *
 *  @param secs  延时时间
 *  @param block 回调
 */
+ (void)runAfterSecs:(float)secs block:(void (^)())block{
    if (block) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, secs*NSEC_PER_SEC),
                       dispatch_get_main_queue(),
                       block);
    }
}

#pragma mark - 其他

/**
 *  构造指定颜色的image
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

/**
 *  构造指定指定大小颜色的image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

/**
 *  转化为驼峰命名法
 *
 *  @param name 变量名称
 *
 *  @return 驼峰命名
 */
+ (NSString *)camelCase:(NSString *)name {
    if ([name length] == 0) return @"";

    NSArray *parts = [name componentsSeparatedByString:@"_"];
    NSString *ret = [parts[0] lowercaseString];
    for (int i = 1; i < [parts count]; ++i) {
        NSString *part = parts[i];
        ret = [ret stringByAppendingFormat:@"%@%@",
               [[part substringToIndex:1] uppercaseString],
               [[part substringFromIndex:1] lowercaseString]];
    }
    return ret;
}

/**
 *  转化为下划线命名法
 *
 *  @param name 变量名称
 *
 *  @return 下划线命名
 */
+ (NSString *)underlineCase:(NSString *)name {
    if ([name length] == 0) return @"";

    unichar ch = tolower([name characterAtIndex:0]);
    NSMutableString *ret = [NSMutableString stringWithCharacters:&ch length:1];
    for (int i = 1; i < [name length]; ++i) {
        unichar ch = [name characterAtIndex:i];
        if (isupper(ch)) [ret appendString:@"_"];
        ch = tolower(ch);
        [ret appendFormat:@"%@", [NSString stringWithCharacters:&ch length:1]];
    }
    return ret;
}

@end
