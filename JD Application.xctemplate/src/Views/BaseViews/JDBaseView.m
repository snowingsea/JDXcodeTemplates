//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDBaseView.h"
#import "JDLayoutCommon.h"

@implementation JDBaseView

#pragma mark - Life Circle

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
        [self config];
        [self setFrame:frame];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addSubviews];
        [self config];
        [self setFrame:self.frame];
    }
    return self;
}

#pragma mark - 初始化

/**
 *  添加子视图
 */
- (void)addSubviews
{
}

/**
 *  配置
 */
- (void)config
{
}

/**
 *  布局
 */
- (void)layout
{
}

#pragma mark -

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if ([self isPointFrame]) return;

    [self layout];
}

/**
 *  判断长宽是否有0值
 *
 *  @return 是否符合
 */
- (BOOL)isPointFrame
{
    return self.height < 1e-7 || self.width < 1e-7;
}

@end
