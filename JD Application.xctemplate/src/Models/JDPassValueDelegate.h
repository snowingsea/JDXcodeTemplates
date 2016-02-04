//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  用于传递数据
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>

typedef enum {
    EUndefinedTag = -1
} PassValueTagType;

@protocol JDPassValueDelegate <NSObject>

/**
 *  传递数据
 *
 *  @param value 所传递数据
 *  @param tag   标记
 */
- (void)passValue:(id)value withTag:(int)tag;

@end
