//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDBadge.h"
#import "JDLayoutCommon.h"

#define RED_DOT_WIDTH       8
#define BADGE_HEIGHT        18
#define BADGE_FONT          [UIFont systemFontOfSize:10]
#define BADGE_COLOR         [UIColor redColor]

@interface JDBadge ()
{
    UILabel *_lbNumber;
    JDBadgeAlignment _alignment;
    NSInteger _num;
}

@end

@implementation JDBadge

- (instancetype)initWithOrigin:(CGPoint)origin
{
    return [self initWithFrame:CGRectMake(origin.x, origin.y, BADGE_HEIGHT, BADGE_HEIGHT)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    frame.size.height = MIN(frame.size.height, frame.size.width);
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.badgeAlignment = JDBadgeAlignmentCenter;
        [self create];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithOrigin:CGPointZero];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return [self initWithOrigin:CGPointZero];
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height = MIN(frame.size.height, frame.size.width);
    [super setFrame:frame];
    _lbNumber.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self setNeedsDisplay];
}

- (void)setOrigin:(CGPoint)origin
{
    _origin = origin;
    CGRect frame = self.frame;
    frame.origin = origin;
    [self setFrame:frame];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGFloat height = rect.size.height;
    // 画左圆
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, height, height));
    [BADGE_COLOR set];
    CGContextFillPath(context);

    // 画右圆
    CGContextAddEllipseInRect(context, CGRectMake(rect.size.width - height, 0, height, height));
    [BADGE_COLOR set];
    CGContextFillPath(context);

    // 画中部矩形
    CGContextFillRect(context, CGRectMake(height / 2, 0, rect.size.width - height, height));
    CGContextStrokePath(context);
}

- (void)create
{
    [self setBackgroundColor:[UIColor clearColor]];

    _lbNumber = [[UILabel alloc]init];
    _lbNumber.font = BADGE_FONT;
    _lbNumber.textAlignment = NSTextAlignmentCenter;
    [_lbNumber setTextColor:[UIColor whiteColor]];
    [self addSubview:_lbNumber];
}

- (void)setBadgeNumber:(NSInteger)num
{
    _num = num;
    if (num < 0) {
        self.hidden = YES;
    } else {
        _lbNumber.text = [NSString stringWithFormat:@"%ld", (long)num];
        [_lbNumber sizeToFit];
        _lbNumber.hidden = (num == 0);

        CGRect frame = self.frame;
        if (num == 0) {
            frame.size.width = RED_DOT_WIDTH;
        } else {
            frame.size.width = MAX(frame.size.height, _lbNumber.frame.size.width * 1.4);
        }
        switch (self.badgeAlignment) {
            case JDBadgeAlignmentRight:
                frame.origin.x = self.frame.origin.x + self.frame.size.width - frame.size.width;
                break;
            case JDBadgeAlignmentCenter:
                frame.origin.x = self.frame.origin.x + (self.frame.size.width - frame.size.width) / 2;
                break;
            default:
                break;
        }
        [self setFrame:frame];

        self.hidden = NO;
    }
}

@end
