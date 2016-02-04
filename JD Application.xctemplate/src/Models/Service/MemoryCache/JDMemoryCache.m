//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDMemoryCache.h"

#pragma mark - 内存存储结构定义

@interface MemoryStorage : NSObject
{
    NSMutableDictionary *_storage;
}
+ (MemoryStorage *)sharedStorage;

- (void)setObject:(id)value forKey:(NSString *)key;
- (id)objectForKey:(id)key;
- (void)removeObjectForKey:(id)key;
- (void)removeAllObjects;

@end

#pragma mark - MemoryCache实现

@implementation JDMemoryCache

+ (void)setValue:(id)value forKey:(NSString *)key
{
    if (value) {
        [[MemoryStorage sharedStorage] setObject:value forKey:key];
    } else {
        [self remove:key];
    }
}

+ (id)get:(NSString *)key
{
    return [[MemoryStorage sharedStorage] objectForKey:key];
}

+ (BOOL)contain:(NSString *)key
{
    return [self get:key] != nil;
}

+ (void)remove:(NSString *)key
{
    [[MemoryStorage sharedStorage]removeObjectForKey:key];
}

+ (void)clear
{
    [[MemoryStorage sharedStorage] removeAllObjects];
}

@end

#pragma mark - MemoryStorage实现

@implementation MemoryStorage

#pragma mark - 单例实现

// 单例
static MemoryStorage *_instance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
- (instancetype)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _storage = [[NSMutableDictionary alloc]init];
    }
    return self;
}

/**
 *  单态
 *
 *  @return 单态对象
 */
+ (MemoryStorage *)sharedStorage
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MemoryStorage alloc] init];
    });
    return _instance;
}

#pragma mark - 功能实现

/**
 *  设置key键对应的值为value
 *
 *  @param value value值
 *  @param key   键值
 */
- (void)setObject:(id)value forKey:(NSString *)key
{
    [_storage setObject:value forKey:key];
}

/**
 *  获取key键对应的值，不存在则返回nil
 *
 *  @param key 键值
 *
 *  @return key键对应的值
 */
- (id)objectForKey:(id)key
{
    return [_storage objectForKey:key];
}

/**
 *  删除key键
 *
 *  @param key 键值
 */
- (void)removeObjectForKey:(id)key
{
    [_storage removeObjectForKey:key];
}

/**
 *  删除所有数据
 */
- (void)removeAllObjects
{
    [_storage removeAllObjects];
}

@end
