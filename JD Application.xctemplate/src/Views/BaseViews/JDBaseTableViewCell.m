//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDBaseTableViewCell.h"
#import "JDLayoutCommon.h"

@implementation JDBaseTableViewCell

#pragma mark - Life Circle

/**
 *  构建cell
 *
 *  @param tableView 所在tableView
 *
 *  @return TableViewCell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *identifierString = [NSString stringWithFormat:@"%@", [self class]];
    id cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault
                           reuseIdentifier:identifierString];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
        [self config];
        [self layoutSubviews];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [self layoutSubviews];
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
