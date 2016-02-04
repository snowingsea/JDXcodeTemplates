//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  API基类
//
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@interface JDAPIService : NSObject

#if NS_BLOCKS_AVAILABLE
typedef void (^ErrorCallback)(NSError *error);
#endif

@end
