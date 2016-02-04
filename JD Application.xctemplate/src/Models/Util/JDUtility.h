//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  共有接口处理类
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 将对象转成字符串
#define STRING(obj)         (obj?[NSString stringWithFormat:@"%@", obj]:nil)
/// 将对象转成字符串并做对比
#define STRING_EQUAL(a, b)  ([STRING((a?a:@"")) isEqualToString:STRING((b?b:@""))])

@interface JDUtility : NSObject

// 系统相关 -------------------------------------------
/// 当前设备型号
+ (NSString *)platformString;

// 加密相关 -------------------------------------------
/// sha1加密算法
+ (NSString*)sha1:(NSString *)input;
/// sha256加密算法
+ (NSString *)sha256:(NSString *)input;

// 判定相关 -------------------------------------------
/// 是否是正整数
+ (BOOL)isPureInt:(NSString *)string;

// GCD多线程 -----------------------------------------
/// 主线程运行
+ (void)runInMainQueue:(void (^)())queue;
/// 进入线程队列
+ (void)runInGlobalQueue:(void (^)())queue;
/// 延时运行
+ (void)runAfterSecs:(float)secs block:(void (^)())block;

// 其他 ----------------------------------------------
/// 构造指定颜色的image
+ (UIImage *)imageWithColor:(UIColor *)color;
/// 构造指定颜色指定大小的image
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/// 驼峰命名
+ (NSString *)camelCase:(NSString *)name;
/// 下划线命名
+ (NSString *)underlineCase:(NSString *)name;

@end
