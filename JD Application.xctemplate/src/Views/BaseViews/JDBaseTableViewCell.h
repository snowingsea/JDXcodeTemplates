//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  TableViewCell基类
//
//___COPYRIGHT___
//

#import <UIKit/UIKit.h>

@interface JDBaseTableViewCell : UITableViewCell

/// 构建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/// 添加子视图
- (void)addSubviews;

/// 配置
- (void)config;

/// 布局
- (void)layout;

@end
