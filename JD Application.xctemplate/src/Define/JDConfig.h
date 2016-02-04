//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  项目配置相关
//
//___COPYRIGHT___
//

#ifndef ___PACKAGENAME_______FILEBASENAMEASIDENTIFIER____h
#define ___PACKAGENAME_______FILEBASENAMEASIDENTIFIER____h

/// 当前状态是否在做单元测试
//#define JD_UNIT_TESTING

/// 服务端测试环境切换
#define JD_TESTING

#ifndef JD_DEBUG
#ifdef DEBUG
    #ifdef JD_TESTING
        #define JD_DEBUG
    #else
        #define JD_RELEASE
    #endif
#else
    #define JD_RELEASE
#endif
#endif

// 日志输出配置 ---------------------------------------
#define ENABLE_LOGGING

#if defined(DEBUG) && defined(ENABLE_LOGGING)
#   define JDLog(fmt, ...)              NSLog((@"__%@__ [Line %d] " fmt), [self class], __LINE__, ## __VA_ARGS__);
#else
#   define JDLog(...)
#endif

// 数据持久化配置 -------------------------------------
/// coredata数据文件
#define DEFAULT_DATABASE                @"___PACKAGENAME___.db"

// 图片配置-------------------------------------------
#define DEFAULT_IMAGE_QUALITY           0.6
#define DEFAULT_IMAGE_COMPRESS_LENGTH   720
#define DEFAULT_IMAGE_RESIZE_LENGTH     1200

// 服务商信息-------------------------------------------------------------------

#define APP_ID
#define TRACH_VIEW_URL                  [NSString stringWithFormat:@"https://itunes.apple.com/us/app/simplr/id%d?ls=1&mt=8", APP_ID]

// 添加其他配置 ---------------------------------------
#define CURRENT_VERSION                 [[[UIDevice currentDevice] systemVersion] floatValue]

#endif /* ___FILEBASENAMEASIDENTIFIER____h */
