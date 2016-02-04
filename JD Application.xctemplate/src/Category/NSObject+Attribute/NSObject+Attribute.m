//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "NSObject+Attribute.h"

@implementation NSObject (Attribute)

/**
 *  判断是否存在某属性
 *
 *  @param attributeName 属性名
 *
 *  @return 结果
 */
- (BOOL)containAttribute:(NSString *)attributeName
{
    if (attributeName == nil) return NO;
    return [self respondsToSelector:NSSelectorFromString(attributeName)];
}

/**
 *  获取键值对应的属性值
 *
 *  @param key 键值
 *
 *  @return value值
 */
- (id)attributeForKey:(NSString *)key
{
    if (key == nil) return nil;
    if (![self containAttribute:key]) return nil;
    return [self valueForKey:key];
}

@end
