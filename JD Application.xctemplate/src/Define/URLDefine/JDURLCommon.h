//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  URL定义
//
//___COPYRIGHT___
//

#ifndef JDURLCommon_h
#define JDURLCommon_h

#import "JDConfig.h"

#define LOCATION_SEPARATOR              @","
#define APPEND(A, B)                    [A stringByAppendingString:B]
#define APPEND_FORMAT(A, fmt, ...)      [A stringByAppendingFormat:(fmt), ## __VA_ARGS__]

#if JD_DEBUG
#define BASE_URI                        @""
#else
#define BASE_URI                        @""
#endif

#define URL(domain)                     APPEND(BASE_URI, domain)

#endif /* ___FILEBASENAMEASIDENTIFIER____h */
