//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDFile.h"

@implementation JDFile

#pragma mark - 文件信息获取

/**
 *  获取绝对路径
 *
 *  @param relpath 相对路径
 *  @param type    目录类型(Document/Caches)
 *
 *  @return 绝对路径
 */
+ (NSString *)getFilepath:(NSString *)relpath pathtype:(PathType)type
{
    if (relpath == nil || [relpath length] == 0)
        return nil;
    switch (type) {
        case EDocuments:
            return DOCUMENTS_PATH(relpath);
        case ECaches:
            return CACHES_PATH(relpath);
    }
    return nil;
}

/**
 *  判断文件是否存在
 *
 *  @param realPath 绝对路径
 *
 *  @return 存在与否
 */
+ (BOOL)existFile:(NSString *)realPath
{
    if (realPath == nil) return false;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:realPath];
}

#pragma mark - 文件操作

/**
 *  创建文件夹
 *
 *  @param dirPath 文件夹相对位置
 *  @param type    文件夹相对位置类型
 */
+ (void)createDir:(NSString *)dirPath pathtype:(PathType)type
{
    NSString *path = [self getFilepath:dirPath pathtype:type];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path])
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

/**
 *  删除文件夹
 *
 *  @param dirPath 文件夹相对路径
 *  @param type    文件夹位置类型
 */
+ (void)removeDir:(NSString *)dirPath pathtype:(PathType)type
{
    NSString *path = [self getFilepath:dirPath pathtype:type];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:path error:nil];
}

/**
 *  删除文件
 *
 *  @param filePath 文件相对路径
 *  @param type     文件位置类型
 */
+ (void)removeFile:(NSString *)filePath pathtype:(PathType)type
{
    [self removeDir:filePath pathtype:type];
}

/**
 *  移动文件
 *
 *  @param from 原始位置
 *  @param to   目标位置
 */
+ (void)moveFile:(NSString *)from to:(NSString *)to
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    [fileManager moveItemAtPath:from toPath:to error:nil];
}

@end
