//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  显示未读消息数目
//
//___COPYRIGHT___
//

#import <UIKit/UIKit.h>

typedef enum {
    JDBadgeAlignmentLeft,
    JDBadgeAlignmentCenter,
    JDBadgeAlignmentRight
} JDBadgeAlignment;

@interface JDBadge : UIView

- (instancetype)initWithOrigin:(CGPoint)origin;

/// 0显示小红点，正数显示数字，负数隐藏
- (void)setBadgeNumber:(NSInteger)num;

@property(nonatomic, assign) JDBadgeAlignment badgeAlignment;
@property(nonatomic) CGPoint origin;

@end
