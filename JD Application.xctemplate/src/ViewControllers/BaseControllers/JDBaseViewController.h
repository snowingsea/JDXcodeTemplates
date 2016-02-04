//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  ViewController基类
//
//___COPYRIGHT___
//

#import <UIKit/UIKit.h>

@interface JDBaseViewController : UIViewController

/// 当前页面名称，用于做用户统计
@property(nonatomic, copy) NSString *screenName;

/// 创建UI前初始化成员变量数据
- (void)initData;
/// 添加视图
- (void)addViews;
/// 初始化事件
- (void)addEvents;
/// 配置数据
- (void)configData;

/// 返回
- (void)popback;
/// 过滤错误，无错误时回调
- (void)filterError:(NSError*)error callback:(void (^)(void))callback;
/// 判断当前Controller是否正在显示
- (BOOL)isVisible;

/// 开启加载动画
- (void)startLoading;
/// 停止加载动画
- (void)stopLoading;

@end
