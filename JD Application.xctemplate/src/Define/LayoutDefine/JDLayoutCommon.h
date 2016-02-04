//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  布局相关
//
//___COPYRIGHT___
//

#ifndef ___PACKAGENAME_______FILEBASENAMEASIDENTIFIER____h
#define ___PACKAGENAME_______FILEBASENAMEASIDENTIFIER____h

#import "UIView+Utils.h"
#import "UIViewExt.h"

#import "JDLayoutCommonColor.h"
#import "JDLayoutCommonFont.h"
#import "JDLayoutCommonMargin.h"

// 布局
#define DEFAULT_SCREEN_HEIGHT           568
#define DEFAULT_SCREEN_WIDTH            320
#define WIDTH_SCALE                     (SCREEN_WIDTH / DEFAULT_SCREEN_WIDTH)
#define HEIGHT_SCALE                    (SCREEN_HEIGHT / DEFAULT_SCREEN_HEIGHT)
#define SCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)
#define TAB_BAR_HEIGHT                  self.tabBarController.tabBar.frame.size.height
#define NAVIGATION_BAR_HEIGHT           MAX(self.navigationController.navigationBar.frame.size.height, 44)
#define STATUS_BAR_HEIGHT               MAX([UIApplication sharedApplication].statusBarFrame.size.height, 20)

// 本地化
#define LOCAL_STRING(name, table)       NSLocalizedStringFromTable(name, table, nil)

// 其他
#define DEFAULT_ANIMATION_DURATION      0.25

#endif /* ___FILEBASENAMEASIDENTIFIER____h */
