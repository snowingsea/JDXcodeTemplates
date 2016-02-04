//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  内存缓存（app被杀掉后该缓存将被销毁）
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>
#import "JDMemoryKeysDefine.h"
#import "JDKVCacheDelegate.h"

@interface JDMemoryCache : NSObject <JDKVCacheDelegate>

@end
