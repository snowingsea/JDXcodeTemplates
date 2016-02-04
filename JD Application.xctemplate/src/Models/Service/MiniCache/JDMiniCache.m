//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDMiniCache.h"

@implementation JDMiniCache

+ (void)setValue:(id)value forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
}

+ (id)get:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (BOOL)contain:(NSString *)key
{
    return [self get:key] != nil;
}

+ (void)remove:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

+ (void)clear
{
    NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
    NSString *appDomainStr = [[NSBundle mainBundle] bundleIdentifier];
    [userDefatluts removePersistentDomainForName:appDomainStr];
    [userDefatluts synchronize];
}

@end
