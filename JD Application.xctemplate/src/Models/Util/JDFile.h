//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  文件操作接口
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@interface JDFile : NSObject

typedef enum {
    EDocuments,
    ECaches
} PathType;

/// 沙盒中Document位置
#define DocumentsDirectory      [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
/// 沙盒中Caches位置
#define CachesDirectory         [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
/// 相对Document路径的完整路径
#define DOCUMENTS_PATH(path)    [DocumentsDirectory stringByAppendingPathComponent:path]
/// 相对Caches路径的完整路径
#define CACHES_PATH(path)       [CachesDirectory stringByAppendingPathComponent:path]

// 文件信息获取 ---------------------------------------------------------------
/// 获取文件路径
+ (NSString *)getFilepath:(NSString *)relpath pathtype:(PathType)type;
/// 判断文件是否存在
+ (BOOL)existFile:(NSString *)realPath;

// 文件操作 -------------------------------------------------------------------
/// 创建文件夹
+ (void)createDir:(NSString *)dirPath pathtype:(PathType)type;
/// 删除文件夹
+ (void)removeDir:(NSString *)dirPath pathtype:(PathType)type;
/// 删除文件
+ (void)removeFile:(NSString *)filePath pathtype:(PathType)type;
/// 移动文件
+ (void)moveFile:(NSString *)from to:(NSString *)to;

@end
