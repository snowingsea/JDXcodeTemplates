//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  对象属性
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@interface NSObject (Attribute)

/// 判断是否存在某属性
- (BOOL)containAttribute:(NSString *)attributeName;

/// 获取键值对应的属性值
- (id)attributeForKey:(NSString *)key;

@end
